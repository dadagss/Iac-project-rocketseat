output "subnet_id" {
  value       = aws_subnet.subnet_public1.id
  sensitive   = false
  description = "ID da sub-rede pública 1"
}
output "subnet_ids" {
  value = [
    aws_subnet.subnet_public1.id,
    aws_subnet.subnet_public2.id
  ]
  sensitive   = false
  description = "ID das duas sub-redes públicas"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  sensitive   = false
  description = "ID da VPC criada"
}
