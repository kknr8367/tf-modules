output "vpc_id" {
  value = module.vpc.vpc_id
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "public_ec2_id" {
  value = module.ec2.public_ec2_id
}

output "private_ec2_id" {
  value = module.ec2.private_ec2_id
}
