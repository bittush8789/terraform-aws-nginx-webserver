variable "subnet_id" {
  description = "The subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the instance"
  type        = list(string)
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "The SSH key name to configure for access"
  type        = string
  default     = null
}

variable "environment" {
  description = "The environment name for tagging purposes"
  type        = string
}
