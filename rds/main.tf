resource "aws_instance" "public_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "${var.name}-public-ec2"
  }
}

resource "aws_instance" "private_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.sg_id]
  associate_public_ip_address = false

  tags = {
    Name = "${var.name}-private-ec2"
  }
}
