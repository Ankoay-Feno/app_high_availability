output "ec2_instance_1_ip" {
  description = "values are the public IPs of the EC2 instances"
  value = module.infrastructure.ec2_instance_1_ip
}

output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value = module.infrastructure.ecr_repository_url
}