# Defining variables this module requires
variable "get_route_table_vpc_id" {}
variable "set_route_table_dest_cidr" {}
variable "get_route_table_igw_id" {}
variable "set_route_table_tag_name" {}

# Create a route table 
resource "aws_route_table" "route_table" {
  vpc_id = var.get_route_table_vpc_id

  route {
    cidr_block = var.set_route_table_dest_cidr
    gateway_id = var.get_route_table_igw_id
  }

  tags = {
    Launched_By = "Terraform"
    Name        = var.set_route_table_tag_name
  }
}

output "route_table_output" {
  value = aws_route_table.route_table.id
}

