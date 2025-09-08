output "private_subnet_id" {
  description = "The ID of the public subnet."
  value       = aws_subnet.private.id
}