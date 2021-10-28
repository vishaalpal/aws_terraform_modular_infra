# Defining variables this module requires
variable "get_eni_subnet_id" {}
variable "set_eni_primary_private_ip_addr" {}
variable "get_eni_sg_id" {}
variable "set_eni_name_tag" {}

# Create a network interface
resource "aws_network_interface" "eni" {
  subnet_id       = var.get_eni_subnet_id
  private_ips     = [var.set_eni_primary_private_ip_addr]
  security_groups = [var.get_eni_sg_id]

  tags = {
    Launched_By = "Terraform"
    Name        = var.set_eni_name_tag
  }
}

output "eni_id_output" {
  description = "Unique identifier for the elastic network interface"
  value       = aws_network_interface.eni.id
}
