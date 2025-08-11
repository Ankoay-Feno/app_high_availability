output "loadbalancer_url" {

  value = module.load_balancer.loadbalancer_url
}

output "ec2_instance_1_ip" {
  description = "values are the public IPs of the EC2 instances"
  value = module.compute.ec2_instance_1_ip
}
output "ec2_instance_2_ip" {
  description = "values are the public IPs of the second EC2 instance"
  value = module.compute.ec2_instance_2_ip
}