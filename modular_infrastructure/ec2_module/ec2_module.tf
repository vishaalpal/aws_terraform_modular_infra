# Defining variables this module requires
variable "set_ec2_ami_id" {}
variable "set_ec2_instance_type" {}
variable "set_ec2_key_pair_name" {}
variable "get_ec2_eni_id" {}
variable "set_ec2_user_data" {}
variable "set_ec2_name_tag" {}

# Create an EC2 instance 
resource "aws_instance" "ec2" {
  ami           = var.set_ec2_ami_id
  instance_type = var.set_ec2_instance_type
  key_name      = var.set_ec2_key_pair_name

  network_interface {
    network_interface_id = var.get_ec2_eni_id
    device_index         = 0
  }

  user_data = var.set_ec2_user_data

  tags = {
    Launched_By = "Terraform"
    Name        = var.set_ec2_name_tag
  }
}
