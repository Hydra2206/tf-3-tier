provider "aws" {
    region = "ap-south-1"
  
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  map_public_ip_on_launch = true

  tags = {
    Name = "chota-bhai"
  }
}

module "eks_cluster" {
  source  = "./modules/eks"
  cluster_name = var.cluster_name
  public_subnets = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  node_group_name = var.node_group_name

}

module "ecr_repos" {
  source = "./modules/ecr"

  for_each  = toset(var.repo_name)
  repo_name = each.value
}


