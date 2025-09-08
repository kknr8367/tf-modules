locals {
  name_suffix = split("-", var.name)[1]
}

resource "aws_db_instance" "main" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  instance_class       = var.db.instance_class
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_subnet.private.name
  vpc_security_group_ids = [aws_security_group.alb_sg.id]
  skip_final_snapshot  = true
  tags = {
    Name = "db-${local.name_suffix}"
  }
}