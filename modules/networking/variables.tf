variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string  
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "VPC"
}

variable "inet_gateway" {
  description = "Name of the Internet Gateway"
  type        = string
  default     = "I-GW"
}