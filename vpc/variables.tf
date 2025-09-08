variable "vpc_cidr" {
  description = "VPC cidr"
  type        = string
  #default     = "10.0.0.0/16"
}
variable "public_cidr" {
  description = "Public subnet cidr"
  type        = string
  #default     = "10.0.1.0/24"
}
variable "private_cidr" {
  description = "The EC2 instance type"
  type        = string
  #default     = "10.0.2.0/24"
}
variable "region" {
  description = "The EC2 instance type"
  type        = string
  #default     = "us-east-1"
}
variable "name" {
  description = "The EC2 instance type"
  type        = string
  #default     = "rds"
}
variable "vpc_cidr" {
  description = "VPC cidr"
  type        = string
  #default     = "o.0.0.0/0"
}