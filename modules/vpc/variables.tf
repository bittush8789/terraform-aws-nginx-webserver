variable "vpc_cidr" {
  description = "The CIDR block for the custom VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "The CIDR block for the public subnet within the VPC"
  type        = string
}

variable "environment" {
  description = "The environment name for tagging purposes"
  type        = string
}
