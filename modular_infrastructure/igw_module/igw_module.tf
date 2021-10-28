# Defining variables this module requires
variable "get_igw_vpc_id" {}
variable "set_igw_tag_name" {}

# Create an internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = var.get_igw_vpc_id

  tags = {
    Launched_By = "Terraform"
    Name        = var.set_igw_tag_name
  }
}

output "igw_resource_output" {
  value = aws_internet_gateway.igw
}

output "igw_id_output" {
  value = aws_internet_gateway.igw.id
}
