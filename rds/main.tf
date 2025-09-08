locals {
  name_suffix = split("-", var.name)
}

resource "aws_db_instance" "main" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  instance_class       = var.db_instance_class
  #name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = var.subnet_group
  vpc_security_group_ids = var.sg
  skip_final_snapshot  = true
  tags = {
    Name = "db-${local.name_suffix}"
  }
}