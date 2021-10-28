# Defining variables this module requires
variable "get_subnet_vpc_id" {}
variable "set_subnet_cidr_range" {}
variable "set_subnet_tag_name" {}

# Create a subnet 
resource "aws_subnet" "subnet" {
  vpc_id     = var.get_subnet_vpc_id
  cidr_block = var.set_subnet_cidr_range

  tags = {
    Launched_By = "Terraform"
    Name        = var.set_subnet_tag_name
  }
}

output "subnet_id_output" {
  value = aws_subnet.subnet.id
}
