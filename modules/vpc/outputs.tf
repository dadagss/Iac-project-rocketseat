output "subnet_id" {
  value       = aws_subnet.subnet_public.id
  sensitive   = false
  description = "ID da sub-rede pública"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID da VPC criada"
}
