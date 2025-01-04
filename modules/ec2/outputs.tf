output "ec2_instance_id" {
  value       = aws_instance.ec2.id
  sensitive   = false
  description = "ID da instância EC2"
}


output "ec2_public_ip" {
  value       = aws_instance.ec2.public_ip
  sensitive   = false
  description = "IP público da instância EC2"
}