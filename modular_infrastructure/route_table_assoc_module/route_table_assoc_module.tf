# Defining variables this module requires
variable "set_route_table_assoc_subnet_id" {}
variable "set_route_table_assoc_route_table_id" {}

# Associate route table with subnet
resource "aws_route_table_association" "route_table_assoc" {
  subnet_id      = var.set_route_table_assoc_subnet_id
  route_table_id = var.set_route_table_assoc_route_table_id
}
