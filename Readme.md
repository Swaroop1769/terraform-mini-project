# Terraform Mini Project

## Project Overview
This project demonstrates the use of Terraform to provision AWS infrastructure. It creates a Virtual Private Cloud (VPC) with three subnets and launches an EC2 instance in the first subnet. The project is designed to be modular and configurable.

## Features
- Conditional creation of VPC and subnets.
- Use of the `coalesce` function to handle optional inputs.
- Deployment of an EC2 instance with a default Amazon Linux 2 AMI.

## Prerequisites
- Terraform installed on your local machine.
- AWS CLI configured with appropriate credentials.
- An AWS account with permissions to create VPCs, subnets, and EC2 instances.

## Variables
The following variables can be configured in `variables.tf`:
- `region`: AWS region to deploy resources.
- `create_vpc`: Boolean to toggle VPC creation.
- `vpc_cidr_block`: CIDR block for the VPC.
- `subnet_id`: Optional subnet ID to deploy resources.

## Usage
1. Initialize Terraform:
   ```bash
   terraform init
   ```
2. Format the configuration files:
   ```bash
   terraform fmt
   ```
3. Plan the infrastructure:
   ```bash
   terraform plan
   ```
4. Apply the configuration:
   ```bash
   terraform apply
   ```

## Outputs
- VPC ID
- Subnet IDs
- EC2 Instance ID

## Notes
- The `coalesce` function is used to select the first non-null value for the subnet ID.
- Ensure that the AWS region specified in `variables.tf` matches your desired deployment region.


