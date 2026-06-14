output "security_group_id" {
  description = "The ID of the Nginx Security Group"
  value       = aws_security_group.nginx_sg.id
}
