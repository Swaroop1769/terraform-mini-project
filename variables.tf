variable "region" {
  type        = string
  description = "The AWS region to deploy resources in"
  default     = "us-west-2"

}

variable "create_vpc" {
  default = true
  type    = bool

}

variable "vpc_cidr_block" {
  description = "IPV4 CIDR range to assign to VPC if creating VPC or to associate as a secondary IPv6 CIDR. Overriden by var.vpc_id output from data.aws_vpc.selected if vpc_id is provided."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_id" {
  description = "The ID of the subnet to deploy resources in"
  type        = string
  default     = null # terraform Keyword like no value is provided
}