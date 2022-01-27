terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  aws_region      = var.aws_region
  aws_zones       = var.aws_zones
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnets

  ## Tags
  tags = var.tags
}

module "minikube" {
  source = "./modules/minikube"

  aws_region           = var.aws_region
  cluster_name         = var.cluster_name
  aws_instance_type    = var.aws_instance_type
  ssh_user             = var.ssh_user
  ssh_private_key      = var.ssh_private_key
  ssh_public_key       = var.ssh_public_key
  aws_subnet_id        = module.vpc.subnet_ids[0]
  hosted_zone          = var.hosted_zone
  hosted_zone_private  = var.hosted_zone_private
  ami_image_id         = var.ami_image_id
  tags                 = var.tags
  addons               = var.addons
}
