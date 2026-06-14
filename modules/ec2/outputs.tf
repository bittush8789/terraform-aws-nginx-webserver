output "instance_id" {
  description = "The ID of the EC2 Instance"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "The public IP address of the EC2 Instance"
  value       = aws_instance.web.public_ip
}

output "public_dns" {
  description = "The public DNS name of the EC2 Instance"
  value       = aws_instance.web.public_dns
}
