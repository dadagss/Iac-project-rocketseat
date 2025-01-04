output "lb_arn" {
  value       = aws_lb.rocket.arn
  description = "ARN do Load Balancer"
}

output "lb_dns_name" {
  value       = aws_lb.rocket.dns_name
  description = "DNS público do Load Balancer"
}