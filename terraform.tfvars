aws_region    = "us-east-1"
environment   = "production"
vpc_cidr      = "10.0.0.0/16"
subnet_cidr   = "10.0.1.0/24"
instance_type = "t2.micro"
key_name      = "my-nginx-key" # Change to a valid AWS Key Pair in your account if you plan to SSH
