resource "aws_key_pair" "key_pair" {
  key_name   = "public-key"
  public_key = file("${var.key_path}") 
}

locals {
  ec2_instances = {
    "instance_1" = { 
      name = "EC2-Instance-1", 
      subnet = var.subnet_1 
    },
    "instance_2" = { 
      name = "EC2-Instance-2", 
      subnet = var.subnet_2 
    }
  }
}

resource "aws_eip" "instance_eip" {
  for_each = local.ec2_instances
  tags = {
    Name = each.value.name
  }
}

resource "aws_instance" "ec2_instance" {
  for_each = local.ec2_instances

  ami           = "ami-044415bb13eee2391"  
  instance_type = "t2.nano"
  key_name      = aws_key_pair.key_pair.key_name
  subnet_id     = each.value.subnet
  vpc_security_group_ids = [var.security_group]
  
  tags = {
    Name = each.value.name
  }
}

resource "aws_eip_association" "eip_association" {
  for_each = aws_instance.ec2_instance

  instance_id   = each.value.id
  allocation_id = aws_eip.instance_eip[each.key].id
}

resource "local_file" "ansible_inventory" {
  depends_on = [ aws_instance.ec2_instance ]
  filename = "${path.root}/ansible/inventory.ini"
  content = templatefile("${var.template_file}", {
    instances = [
      for k, instance in aws_instance.ec2_instance : {
        name       = instance.tags.Name,
        public_ip  = instance.public_ip,
        ssh_user   = "ubuntu",
        ssh_key_path    = "${abspath(".")}/keys/key"
      }
    ]
  })
}