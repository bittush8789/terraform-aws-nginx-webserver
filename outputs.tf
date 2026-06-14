# Expose critical infrastructure endpoints and resource IDs
output "vpc_id" {
  description = "The ID of the custom VPC"
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "The ID of the public subnet"
  value       = module.vpc.subnet_id
}

output "security_group_id" {
  description = "The ID of the security group created for the EC2 Instance"
  value       = module.security_group.security_group_id
}

output "instance_id" {
  description = "The ID of the EC2 Instance"
  value       = module.ec2.instance_id
}

output "public_ip" {
  description = "The public IP address of the EC2 Instance"
  value       = module.ec2.public_ip
}

output "public_dns" {
  description = "The public DNS name of the EC2 Instance"
  value       = module.ec2.public_dns
}
