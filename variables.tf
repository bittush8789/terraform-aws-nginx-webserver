variable "aws_region" {
  description = "The AWS Region to deploy the infrastructure in"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "The environment name for tagging purposes (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "The CIDR block for the custom VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the public subnet within the VPC"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "The EC2 instance type to deploy"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the AWS EC2 Key Pair to associate with the instance (optional)"
  type        = string
  default     = null
}
