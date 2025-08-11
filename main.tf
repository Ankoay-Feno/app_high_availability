module "app_high_availability" {
  source = "./environments/stages"
}

resource "null_resource" "force_provision" {
  depends_on = [ module.app_high_availability ]
  
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
        -i '${path.root}/ansible/inventory.ini' \
        '${path.root}/ansible/common.yaml' \
        '${path.root}/ansible/instance_1.yaml' \
        '${path.root}/ansible/instance_2.yaml'
    EOT
  }
}