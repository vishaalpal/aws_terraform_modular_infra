# Defining variables this module requires
variable "set_vpc_cidr_range" {}
variable "set_instance_tenancy" {}
variable "set_enable_dns_support" {}
variable "set_enable_dns_hostnames" {}
variable "set_vpc_tag_name" {}

# Create a VPC  
resource "aws_vpc" "vpc" {
  cidr_block           = var.set_vpc_cidr_range
  instance_tenancy     = var.set_instance_tenancy
  enable_dns_support   = var.set_enable_dns_support
  enable_dns_hostnames = var.set_enable_dns_hostnames

  tags = {
    Launched_By = "Terraform"
    Name        = var.set_vpc_tag_name
  }
}

output "vpc_id_output" {
  value = aws_vpc.vpc.id
}
