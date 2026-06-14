# Root main.tf coordinating the VPC, Security Group, and EC2 modules

module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  environment = var.environment
}

module "security_group" {
  source      = "./modules/security-group"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
}

module "ec2" {
  source             = "./modules/ec2"
  subnet_id          = module.vpc.subnet_id
  security_group_ids = [module.security_group.security_group_id]
  instance_type      = var.instance_type
  key_name           = var.key_name
  environment        = var.environment
}
