locals {
  public_instances_json = { for k, instance in aws_instance.ec2_instance: k => instance }
}

output "ec2_instance_1_id" {
  value = local.public_instances_json["instance_1"].id
}

output "ec2_instance_2_id" {
  value = local.public_instances_json["instance_2"].id
}


output "ec2_instance_1_ip" {
  value = local.public_instances_json["instance_1"].public_ip
}

output "ec2_instance_2_ip" {
  value = local.public_instances_json["instance_2"].public_ip
}