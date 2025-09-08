variable "all_cidr" {
  description = "VPC cidr"
  type        = string
  #default     = "0.0.0.0/0"
}

variable "name" {
  description = "The EC2 instance type"
  type        = string
  #default     = "rds"
}
variable "vpc" {}