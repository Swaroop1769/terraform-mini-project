provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  count      = var.create_vpc == true ? 1 : 0 ## Conditional creation of VPC based on variable
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "project-vpc-01"
  }
}

resource "aws_subnet" "mainsubnet" {
  count      = var.create_vpc == true ? 3 : 0                 ## Conditional creation of Subnet based on variable
  vpc_id     = aws_vpc.main[0].id                             ## Reference to the created VPC
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index) ## Creating 3 subnets in the VPC
  tags = {
    Name = "privatesubnet-${count.index}"
  }

}

###normally terraform names the 3 subnets as aws_subnet.mainsubnet[0], aws_subnet.mainsubnet[1], aws_subnet.mainsubnet[2]
resource "aws_instance" "mainec2" {
  ami           = "ami-0c55b159cbfafe1f0" ## Amazon Linux 2 AMI
  instance_type = "t2.micro"
  #subnet_id = aws_subnet.mainsubnet[0].id ## [0] here refers to the first created subnet
  subnet_id = coalesce(var.subnet_id, try(aws_subnet.mainsubnet[0].id, null)) ## using coalesce function to check if subnet_id is provided or not
}