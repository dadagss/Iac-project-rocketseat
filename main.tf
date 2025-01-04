module "vpc" {
  source   = "./modules/vpc"
  Region   = "us-east-1a"
  vpc_cidr = "10.0.0.0/16"
  vpc_tags = {
    Name    = "-VPC-${terraform.workspace}"
    Iac     = true
    context = "${terraform.workspace}"
  }
}

module "ec2" {
  source            = "./modules/ec2"
  ec2_instance_name = "batata"
  ec2_id            = module.ec2.ec2_id
  instance_type     = "t2.micro"
  subnet_id         = module.vpc.subnet_id
  ec2_tags = {
    Name    = "-ec2-${terraform.workspace}"
    Iac     = true
    context = "${terraform.workspace}"
  }
}

module "lb" {
  source            = "./modules/lb"
  subnet_id         = module.vpc.subnet_id
  ec2_id            = module.ec2.ec2_id
  security_group_id = module.lb_sg.security_group_id
  vpc_id            = module.vpc.vpc_id
  lb_tags = {
    Name       = "LB-${terraform.workspace}"
    Iac        = true
    Environment = "dev"
  }
}

module "lb_sg" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  sg_tags = {
    Name = "LB-SG-${terraform.workspace}"
    Iac  = true
    context = "${terraform.workspace}"
  }
}