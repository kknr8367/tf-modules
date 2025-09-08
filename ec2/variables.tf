
variable "name" {}
variable "ami_id" {}
variable "instance_type" {
  default = "t3.micro"
}
variable "public_subnet_id" {}
variable "private_subnet_id" {}
variable "sg_id" {}
