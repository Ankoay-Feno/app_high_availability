output "loadbalancer_url" {
  value = "http://${aws_lb.load_balancer_ec2.dns_name}"
}