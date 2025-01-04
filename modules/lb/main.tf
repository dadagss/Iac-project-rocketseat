resource "aws_security_group" "lb_sg" {
  name        = "lb-security-group"
  description = "Security group for the Load Balancer"
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

  tags = {
    Name = "lb-security-group"
    Iac  = true
  }
}

resource "aws_lb" "rocket" {
  name               = "rocket-lb-tf"
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids


  tags = var.lb_tags
}

resource "aws_lb_target_group" "rocket" {
  name     = "rocket-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "rocket" {
  target_group_arn = aws_lb_target_group.rocket.arn
  target_id        = var.ec2_id
  port             = 80
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.rocket.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rocket.arn
  }
}
