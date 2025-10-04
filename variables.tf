variable "region" {
  type        = string
  description = "The AWS region to deploy resources in."
  default     = "us-west-2"
}

variable "create_vpc" {
  type        = bool
  description = "Whether to create a new VPC."
  default     = true
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "subnet_id" {
  type        = string
  description = "The ID of an existing subnet to use. If not provided, new subnets will be created."
  default     = null
}