module "vpc" {
  source              = "./vpc"
  vpc_name            = "my-vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
  azs                 = ["us-east-1a", "us-east-1b"]
}

module "security_group" {
  source        = "./security_group"
  name          = "my-app"
  vpc_id        = module.vpc.vpc_id
  db_port       = 5432
  allowed_cidrs = ["10.0.0.0/16"]
}

module "rds" {
  source           = "./rds"
  name             = "my-app"
  engine           = "postgres"
  instance_class   = "db.t3.micro"
  allocated_storage = 20
  username         = "admin"
  password         = "yourSecurePassword123"
  subnet_ids       = module.vpc.private_subnets
  sg_id            = module.security_group_rds.sg_id
}
