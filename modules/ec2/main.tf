# EC2 instance resource with dynamic AMI fetching for Amazon Linux 2023

# Dynamic resolution of the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# The Nginx EC2 Instance
resource "aws_instance" "web" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = true
  key_name                    = var.key_name

  # Provision script to install, enable, and start Nginx
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install nginx -y
              systemctl enable nginx
              systemctl start nginx
              EOF

  tags = {
    Name        = "${var.environment}-nginx-server"
    Environment = var.environment
  }
}
