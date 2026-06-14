variable "vpc_id" {
  description = "The ID of the VPC where the Security Group will be created"
  type        = string
}

variable "environment" {
  description = "The environment name for tagging purposes"
  type        = string
}
