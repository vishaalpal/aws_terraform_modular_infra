# Defining variables this module requires
variable "set_sg_name" {}
variable "set_sg_description" {}
variable "get_sg_vpc_id" {}
variable "set_sg_ingress_open" {}
variable "set_sg_ingress_custom" {}
variable "set_sg_egress_open" {}
/* variable "set_sg_egress_custom" {} */
variable "set_sg_name_tag" {}

# Create a security group
resource "aws_security_group" "sg" {
  name        = var.set_sg_name
  description = var.set_sg_description
  vpc_id      = var.get_sg_vpc_id

  ingress {
    description = "ALL HTTP ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.set_sg_ingress_open]
  }

  ingress {
    description = "ALL HTTPS ingress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.set_sg_ingress_open]
  }

  ingress {
    description = "Custom SSH ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.set_sg_ingress_custom]
  }

  egress {
    description = "ALL egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.set_sg_egress_open]
  }

  tags = {
    Launched_By = "Terraform"
    Name        = var.set_sg_name_tag
  }
}

output "sg_id_output" {
  value = aws_security_group.sg.id
}
