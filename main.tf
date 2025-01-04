locals {
  environment = terraform.workspace
}

module "vpc" {
  source   = "./modules/vpc"
  Region   = "us-east-1a"
  Region2  = "us-east-1b"
  vpc_cidr = local.environment == "prod" ? "10.0.0.0/16" : local.environment == "staging" ? "10.1.0.0/16" : "10.2.0.0/16"
  vpc_tags = {
    Name    = "VPC-${local.environment}"
    Iac     = true
    context = local.environment
  }
}

module "ec2" {
  source        = "./modules/ec2"
  instance_type = local.environment == "prod" ? "t3.medium" : local.environment == "staging" ? "t2.medium" : "t2.micro"
  subnet_id     = module.vpc.subnet_id
  ec2_tags = {
    Name    = "EC2-${local.environment}"
    Iac     = true
    context = local.environment
  }
  depends_on = [
    module.vpc
  ]
}

module "lb" {
  source            = "./modules/lb"
  subnet_ids        = module.vpc.subnet_ids
  ec2_id            = module.ec2.ec2_id
  security_group_id = module.lb_sg.security_group_id
  vpc_id            = module.vpc.vpc_id
  lb_tags = {
    Name        = "LB-${local.environment}"
    Iac         = true
    Environment = local.environment
  }
  depends_on = [
    module.vpc,
    module.ec2
  ]
}

module "lb_sg" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  sg_tags = {
    Name    = "LB-SG-${local.environment}"
    Iac     = true
    context = local.environment
  }
}
