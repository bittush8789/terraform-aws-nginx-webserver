# Terraform AWS Nginx Web Server

A modular, production-ready Terraform project that provisions a custom VPC network, security configurations, and a web server instance on Amazon Web Services (AWS) running an automatically installed Nginx server.

---

## Architecture Overview

This project builds a clean, public-facing architecture on AWS:

*   **VPC**: Custom Virtual Private Cloud (`10.0.0.0/16`) to isolate the environment.
*   **Subnet**: A public subnet (`10.0.1.0/24`) with auto-assign public IP enabled.
*   **Gateway**: Internet Gateway (IGW) attached to the custom VPC.
*   **Routing**: Route Table mapping all outbound traffic (`0.0.0.0/0`) to the Internet Gateway.
*   **Security Group**: Firewall rules allowing incoming traffic on ports `22` (SSH), `80` (HTTP), and `443` (HTTPS).
*   **EC2 Instance**: Virtual machine running Amazon Linux 2023 (`t2.micro` by default) with an automatic bootstrap configuration installing and enabling Nginx.

---

## Directory Structure

```text
.
├── README.md               # Repository documentation
├── main.tf                 # Root orchestrator linking modules
├── variables.tf            # Root variables definitions
├── outputs.tf              # Aggregated root outputs
├── providers.tf            # AWS Provider configuration
├── versions.tf             # Terraform & provider version constraints
├── terraform.tfvars        # Environment-specific configuration values
└── modules/
    ├── vpc/                # Custom VPC network resources
    ├── security-group/     # Ingress & egress firewall rules
    └── ec2/                # Dynamic AMI resolution & instance bootstrap
```

---

## Prerequisites

Before executing this project, ensure you have:

*   [Terraform](https://developer.hashicorp.com/terraform/downloads) `>= 1.8.0` installed.
*   An active [AWS Account](https://aws.amazon.com/) with IAM permissions configured to provision VPCs, Security Groups, and EC2 Instances.
*   [AWS CLI](https://aws.amazon.com/cli/) installed and configured (`aws configure`).

---

## Quick Start & Deployment Workflow

### 1. Initialize Working Directory
Downloads provider plugins and registers modules:
```bash
terraform init
```

### 2. Validate & Format Code
Verify syntax correctness and enforce canonical HCL formatting:
```bash
terraform fmt -recursive
terraform validate
```

### 3. Generate Execution Plan
Preview the infrastructure changes Terraform will make:
```bash
terraform plan
```

### 4. Deploy Infrastructure
Apply the configurations (confirm by typing `yes` when prompted):
```bash
terraform apply
```

### 5. Tear Down / Destroy Resources
Clean up and delete all provisioned AWS resources to avoid billing:
```bash
terraform destroy
```

---

## Configuration Variables

The following inputs are defined in [variables.tf](file:///d:/Terraform-Projects/variables.tf) and can be configured in [terraform.tfvars](file:///d:/Terraform-Projects/terraform.tfvars):

| Variable Name | Description | Type | Default |
| :--- | :--- | :--- | :--- |
| `aws_region` | The AWS Region to deploy the infrastructure in | `string` | `us-east-1` |
| `environment` | The name of the environment (e.g. dev, prod) | `string` | `dev` |
| `vpc_cidr` | Network IP range for the custom VPC | `string` | `10.0.0.0/16` |
| `subnet_cidr` | Network IP range for the public subnet | `string` | `10.0.1.0/24` |
| `instance_type` | CPU and memory specification for the EC2 Instance | `string` | `t2.micro` |
| `key_name` | Name of the AWS EC2 Key Pair for SSH authorization | `string` | `null` |

---

## Outputs

After a successful deployment, Terraform outputs these resources details:

| Output Name | Description |
| :--- | :--- |
| `vpc_id` | Unique ID of the created VPC |
| `subnet_id` | Unique ID of the Public Subnet |
| `security_group_id` | Firewall Security Group ID |
| `instance_id` | EC2 Instance ID |
| `public_ip` | Public IPv4 Address to access the Nginx Web Page |
| `public_dns` | Public DNS of the web server |

---

## License

This project is licensed under the MIT License.
