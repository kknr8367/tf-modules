output "public_subnet_id" {
  description = "The ID of the public subnet."
  value       = aws_subnet.public.id
}

output "vpc_id" {
  description = "The ID of the public subnet."
  value       = aws_vpc.main.id
}

output "private_subnet_id" {
  description = "The ID of the public subnet."
  value       = aws_subnet.private.name
}

output "subnet_group" {
  value = aws_db_subnet_group.default.name
}