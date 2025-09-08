variable "ami_id" {
  description = "ami id"
  type        = string
  #default     = "ami-00ca32bbc84273381"
}
variable "instance_type" {
  description = "instance type"
  type        = string
  #default     = "t2.micro"
}

variable "subnet_id" {
  description = "subnet id"
  type        = string
  #default     = aws_subnet.public.id
}
variable "security_group_id" {
  description = "db user name"
  type        = string
  #default     = aws_security_group.alb_sg.id
}
variable "key_name" {
  description = "key pair name"
  type        = string
  #default     = "k8s.pem"
}