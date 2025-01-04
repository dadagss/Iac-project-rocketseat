resource "aws_instance" "ec2-rocket" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = var.ec2_tags
}



