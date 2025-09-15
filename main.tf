module "infrastructure" {
  source = "./environments/stages"
}

resource "null_resource" "force_provision" {
  depends_on = [ module.infrastructure ]
  
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
        -i '${path.root}/ansible/inventory.ini' \
        '${path.root}/ansible/common.yaml' \
    EOT
  }
}