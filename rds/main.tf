terraform {
  required_version = ">= 1.5.0"
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.name}-subnet-group"
  }
}

resource "aws_db_instance" "rds" {
  identifier              = "${var.name}-db"
  engine                  = var.engine
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  username                = var.username
  password                = var.password
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [var.sg_id]
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = false
}
