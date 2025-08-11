resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Allow all traffics"
  vpc_id      = var.main_vpc

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}