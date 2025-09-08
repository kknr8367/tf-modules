locals {
  name_suffix = split("-", var.name)[1]
}

module "vpc" {
  source = "./vpc"
  vpc_cidr = var.vpc_cidr
  public_cidr = var.public_cidr
  private_cidr = var.private_cidr
  region = var.region
  #all_cidr = var.all_cidr
  name = "vpc-${local.name_suffix}"
}

module "security_group_ec2" {
  source = "./sg"
  name = "sg-${local.name_suffix}"
  all_cidr = var.all_cidr
}

module "ec2_instance" {
  source = "./ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  subnet_id = vpc.private_subnet_id
  security_group_id = module.security_group_ec2.sg_id
  key_name = var.key_name
  name = "ec2-${local.name_suffix}"
  user_data = templatefile("${path.module}/templates/user_data.sh.tpl", {
    rds_endpoint = module.rds_db.db_endpoint
    rds_username = var.db_username
    rds_password = var.db_password
  })
}

module "rds_db" {
  source = "./rds"
  name = "db-${local.name_suffix}"
  allocated_storage = var.allocated_storage
  engine = var.engine
  db_instance_class = var.db_instance_class
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}