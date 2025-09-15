output "vpc_id" {
  value = aws_vpc.main.id
}

locals {
  public_subnet_ids_json = { for k, subnet in aws_subnet.public_subnet: k => subnet.id }
}

output "subnet_1" {
  value = local.public_subnet_ids_json["a"]
}
