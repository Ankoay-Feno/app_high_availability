
resource "aws_lb" "load_balancer_ec2" {
  name = "load-balancer-ec2"
  internal = false
  load_balancer_type = "application"
  security_groups = [var.security_group]
  subnets = [var.subnet_1, var.subnet_2]
}

resource "aws_lb_target_group" "target_group_ec2" {
  name     = "target-group-ec2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    protocol            = "HTTP"
    path                = "/"
    interval            = 10
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.load_balancer_ec2.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_ec2.arn
  }
  
}

resource "aws_lb_target_group_attachment" "ec2_instance_1_attachment" {
  target_group_arn = aws_lb_target_group.target_group_ec2.arn
  target_id        = var.ec2_instance_1_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "ec2_instance_2_attachment" {
  target_group_arn = aws_lb_target_group.target_group_ec2.arn
  target_id        = var.ec2_instance_2_id
  port             = 80
  
}

output "alb_dns_name" {
  value = "http://${aws_lb.load_balancer_ec2.dns_name}"
}