resource "aws_security_group" "lb_sg" {
  name        = "lb-sg"
  description = "Security group for Load Balancer"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg_tags
}

output "security_group_id" {
  value       = aws_security_group.lb_sg.id
  description = "ID do Security Group do Load Balancer"
}
