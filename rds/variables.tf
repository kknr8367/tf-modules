variable "allocated_storage" {
  description = "VPC cidr"
  type        = string
  #default     = "20"
}
variable "engine" {
  description = "Public subnet cidr"
  type        = string
  #default     = "mysql"
}
variable "db_instance_class" {
  description = "The instance type"
  type        = string
  #default     = "t2.micro"
}
variable "db_name" {
  description = "db name"
  type        = string
  #default     = "kamal-db"
}
variable "db_username" {
  description = "db user name"
  type        = string
  #default     = "kamal-db"
}
variable "db_password" {
  description = "db password"
  type        = string
  #default     = "kamal321"
}
variable "name" {
  description = "common name"
  type        = string
  #default     = "rds"
}
variable "subnet_group" {
  description = "subnet group"
  type        = string
}