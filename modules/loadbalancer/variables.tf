variable "security_group" {
    description = "value of the security group to be used for the EC2 instances and load balancer"
    type        = string
}

variable "subnet_1" {
    description = "ID of the first subnet for the load balancer"
    type        = string 
}

variable "subnet_2" {
    description = "ID of the second subnet for the load balancer"
    type        = string 
}

variable "vpc_id" {
    description = "ID of the VPC where the load balancer will be created"
    type        = string  
}

variable "ec2_instance_1_id" {
    description = "ID of the second EC2 instance to be attached to the load balancer"
    type        = string
}
variable "ec2_instance_2_id" {
    description = "ID of the second EC2 instance to be attached to the load balancer"
    type        = string
}