output "loadbalancer_url" {
  value = module.app_high_availability.loadbalancer_url
}

output "ec2_instance_1_ip" {
  description = "values are the public IPs of the EC2 instances"
  value = module.app_high_availability.ec2_instance_1_ip
}

output "ec2_instance_2_ip" {
  description = "values are the public IPs of the second EC2 instance"
  value = module.app_high_availability.ec2_instance_2_ip
}