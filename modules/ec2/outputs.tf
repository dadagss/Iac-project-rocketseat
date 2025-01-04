output "ec2_id" {
  value       = aws_instance.ec2rocket.id
  sensitive   = false
  description = "ID da instância EC2"
}

output "ec2_public_ip" {
  value       = aws_instance.ec2rocket.public_ip
  sensitive   = false
  description = "IP público da instância EC2"
}