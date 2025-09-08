
module "vpc" {
  source = "./vpc"
  vpc_cidr = var.vpc_cidr
  public_cidr = var.public_cidr
  private_cidr = var.private_cidr
  region = var.region
  all_cidr = var.all_cidr
  name = "vpc-prod"
}
