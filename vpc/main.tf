locals {
  name_suffix = split("-", var.name)
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  
  tags = {
    Name = "vpc-${local.name_suffix}"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_cidr
  availability_zone       = var.region
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${local.name_suffix}"
  }
}
resource "aws_subnet" "private1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_cidr
  availability_zone       = var.region
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet-${local.name_suffix}"
  }
}

resource "aws_subnet" "private2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_cidr1
  availability_zone       = var.region
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet2-${local.name_suffix}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "igw-${local.name_suffix}"
  }
}

resource "aws_nat_gateway" "main" {
  subnet_id     = aws_subnet.public.id
  tags = {
    Name = "nat-${local.name_suffix}"
  }
  depends_on = [aws_internet_gateway.main]
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.all_cidr
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "public-rt-${local.name_suffix}"
  }
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.all_cidr
    gateway_id = aws_nat_gateway.main.id
  }
  tags = {
    Name = "private-rt-${local.name_suffix}"
  }
}
resource "aws_route_table_association" "public_associate1" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private_associate" {
    subnet_id      = aws_subnet.private1.id
      route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private_associate1" {
    subnet_id      = aws_subnet.private2.id
      route_table_id = aws_route_table.private.id
}
resource "aws_db_subnet_group" "default" {
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]
  tags = {
    Name = "subgrp-${local.name_suffix}"
  }
}