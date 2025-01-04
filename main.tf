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
  subnet_id         = module.vpc.subnet_id
  ec2_tags = {
    Name    = "-ec2-${terraform.workspace}"
    Iac     = true
    context = "${terraform.workspace}"
  }
}