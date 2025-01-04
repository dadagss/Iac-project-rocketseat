resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = var.vpc_tags
}

resource "aws_subnet" "subnet_public1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, 1)
  availability_zone       = var.Region
  map_public_ip_on_launch = true

  tags = var.vpc_tags
}

resource "aws_subnet" "subnet_public2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, 2)
  availability_zone       = var.Region2
  map_public_ip_on_launch = true

  tags = var.vpc_tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "InternetGateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = var.vpc_tags
}

resource "aws_route_table_association" "public_association_1" {
  subnet_id      = aws_subnet.subnet_public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_association_2" {
  subnet_id      = aws_subnet.subnet_public2.id
  route_table_id = aws_route_table.public.id
}
