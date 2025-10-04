provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  count      = var.create_vpc ? 1 : 0 # Create VPC only if create_vpc is true
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "project-vpc-01"
  }
}

resource "aws_subnet" "mainsubnet" {
  count      = var.create_vpc ? 3 : 0 # Create 3 subnets if VPC is created
  vpc_id     = aws_vpc.main[0].id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  tags = {
    Name = "privatesubnet-${count.index}"
  }
}

resource "aws_instance" "mainec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     = coalesce(var.subnet_id, try(aws_subnet.mainsubnet[0].id, null))
  tags = {
    Name = "project-ec2-instance"
  }
}

output "vpc_id" {
  value       = aws_vpc.main[0].id
  description = "The ID of the created VPC."
}

output "subnet_ids" {
  value       = aws_subnet.mainsubnet[*].id
  description = "The IDs of the created subnets."
}

output "ec2_instance_id" {
  value       = aws_instance.mainec2.id
  description = "The ID of the created EC2 instance."
}