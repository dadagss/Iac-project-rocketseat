output "ec2_id" {
  value       = var.ec2_id
  sensitive   = false
  description = "ID da instância EC2"
}

output "ec2_ip" {
  value       = data.aws_instance.ec2.public_ip
  sensitive   = false
  description = "IP público da instância EC2"
}
