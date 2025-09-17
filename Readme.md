# Terraform Mini Project

This project sets up a VPC with 3 subnets and launches an EC2 instance in the first subnet — or uses an existing subnet ID if provided.

## Coalesce Function

Uses `coalesce()` to select the first non-null, non-empty value:
```hcl
subnet_id = coalesce(var.existing_subnet_id, aws_subnet.subnet_1.id)
```

## Usage

```bash
terraform init
terraform fmt
terraform plan
terraform apply
```


