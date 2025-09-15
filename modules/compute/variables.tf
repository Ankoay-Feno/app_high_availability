variable "subnet_1" {
  description = "Subnet 1 for EC2 instances"
  type        = string  
}

variable "security_group" {
  description = "Security group ID for EC2 instances"
  type        = string
}

variable "key_path" {
  description = "Path to the public key file for EC2 instances"
  type        = string
}

variable "template_file" {
  description = "Path to the Ansible inventory template file"
  type        = string
}