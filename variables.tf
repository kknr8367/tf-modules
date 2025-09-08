variable "vpc_cidr" {
  description = "VPC cidr"
  type        = string
  default     = "10.0.0.0/16"
}
variable "public_cidr" {
  description = "Public subnet cidr"
  type        = string
  default     = "10.0.1.0/24"
}
variable "private_cidr" {
  description = "The EC2 instance type"
  type        = string
  default     = "10.0.2.0/24"
}
variable "region" {
  description = "The EC2 instance type"
  type        = string
  default     = "us-east-1"
}
variable "all_cidr" {
  description = "VPC cidr"
  type        = string
  default     = "0.0.0.0/0"
}
variable "ami_id" {
  description = "ami id"
  type        = string
  default     = "ami-00ca32bbc84273381"
}
variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}
variable "key_name" {
  description = "key pair name"
  type        = string
  default     = "k8s.pem"
}
variable "allocated_storage" {
  description = "VPC cidr"
  type        = string
  default     = "20"
}
variable "engine" {
  description = "Public subnet cidr"
  type        = string
  default     = "mysql"
}
variable "db_instance_class" {
  description = "The instance type"
  type        = string
  default     = "db.t2.micro"
}
variable "db_name" {
  description = "db name"
  type        = string
  default     = "kamal-db"
}
variable "db_username" {
  description = "db user name"
  type        = string
  default     = "kamal-db"
}
variable "db_password" {
  description = "db password"
  type        = string
  default     = "kamal321"
}
variable "name" {
  description = "db password"
  type        = string
  default     = "rds"
}