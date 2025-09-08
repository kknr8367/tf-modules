variable "name" {
  type = string
}
variable "engine" {
  default = "postgres"
}
variable "instance_class" {
  default = "db.t3.micro"
}
variable "allocated_storage" {
  default = 20
}
variable "username" {}
variable "password" {}
variable "subnet_ids" {
  type = list(string)
}
variable "sg_id" {}
