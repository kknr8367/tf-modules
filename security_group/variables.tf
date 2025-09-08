variable "name" {}
variable "vpc_id" {}
variable "db_port" {
  default = 5432
}
variable "allowed_cidrs" {
  type = list(string)
}
