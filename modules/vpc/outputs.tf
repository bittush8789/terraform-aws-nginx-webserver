output "vpc_id" {
  description = "The ID of the custom VPC"
  value       = aws_vpc.this.id
}

output "subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}
