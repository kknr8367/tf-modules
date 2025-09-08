locals {
  name_suffix = split("-", var.name)[1]
}

resource "aws_security_group" "alb_sg" {
  name        = "sg-${local.name_suffix}"
  description = "Allow inbound traffic on ports 80, 443, and 22"
   
  vpc_id = sg.vpc_id

  
  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.all_cidr
  }

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.all_cidr
  }

 
  ingress {
    description = "Allow HTTPS traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.all_cidr
  }

 
  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.all_cidr
  }

 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.all_cidr
  }

  tags = {
    Name = "sg-${local.name_suffix}"
  }
}