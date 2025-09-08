output "sg" {
  description = "The ID of the public subnet."
  value       = aws_security_group.alb_sg.id
}