# Defining variables this module requires
variable "get_eip_eni_id" {}
variable "set_eip_private_ip_assoc" {}
variable "get_eip_igw_dependency" {}
variable "set_eip_name_tag" {}

# Create and associate an EIP
resource "aws_eip" "create_eip" {
  vpc = true

  network_interface         = var.get_eip_eni_id
  associate_with_private_ip = var.set_eip_private_ip_assoc
  depends_on                = [var.get_eip_igw_dependency]

  tags = {
    Launched_By = "Terraform"
    Name        = var.set_eip_name_tag
  }
}
