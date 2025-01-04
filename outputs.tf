output "ec2_public_ip" {
  value       = module.ec2.ec2_public_ip
  sensitive   = false
  description = "IP público da instância EC2"
}

output "lb_dns_name" {
  value       = module.lb.lb_dns_name
  sensitive   = false
  description = "DNS público do Load Balancer"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  sensitive   = false
  description = "ID da VPC criada"
}

output "subnet_id" {
  value       = module.vpc.subnet_id
  sensitive   = false
  description = "ID da sub-rede pública"
}