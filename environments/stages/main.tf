module "security" {
  source = "../../modules/security"

  main_vpc = module.networking.vpc_id  
}

module "networking" {
  source = "../../modules/networking"

  cidr_block = "10.0.0.0/16"
  vpc_name = "main-vpc"
  inet_gateway = "main-internet-gateway"
}

module "compute" {
  source = "../../modules/compute"

 key_path = "${path.root}/keys/key.pub"
 subnet_1 = module.networking.subnet_1
 security_group = module.security.security_group_id
 template_file = "${path.root}/ansible/inventory.tpl"
}

module "container_registry" {
  source = "../../modules/ecr"

  repository_name = "strapi-repo"
}