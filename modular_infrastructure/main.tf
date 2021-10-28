#Import required module to create a VPC
module "create_vpc" {
  source                   = "./vpc_module"
  set_vpc_cidr_range       = "192.168.0.0/16"
  set_instance_tenancy     = "default"
  set_enable_dns_support   = true
  set_enable_dns_hostnames = true
  set_vpc_tag_name         = "modular vpc"
}

#Import required module to create a Subnet
module "create_subnet" {
  source                = "./subnet_module"
  get_subnet_vpc_id     = module.create_vpc.vpc_id_output
  set_subnet_cidr_range = "192.168.1.0/24"
  set_subnet_tag_name   = "modular subnet"
}

#Import required module to create an Internet-Gateway
module "create_igw" {
  source           = "./igw_module"
  get_igw_vpc_id   = module.create_vpc.vpc_id_output
  set_igw_tag_name = "modular igw"
}

#Import required module to create a route table
module "create_route_table" {
  source                    = "./route_table_module"
  get_route_table_vpc_id    = module.create_vpc.vpc_id_output
  set_route_table_dest_cidr = "0.0.0.0/0"
  get_route_table_igw_id    = module.create_igw.igw_id_output
  set_route_table_tag_name  = "modular route table"
}

#Import required module to create a route table association
# Fix this later, it is currently automatically GETTING the value of "set_route_table_assoc_subnet_id", "set_route_table_assoc_route_table_id". Modify it to allow the user to input this value.  
module "create_route_table_assoc" {
  source                               = "./route_table_assoc_module"
  set_route_table_assoc_subnet_id      = module.create_subnet.subnet_id_output
  set_route_table_assoc_route_table_id = module.create_route_table.route_table_output
}

#Import required module to allocate an EIP
module "create_eip" {
  source                   = "./eip_module"
  get_eip_eni_id           = module.create_eni.eni_id_output
  set_eip_private_ip_assoc = "192.168.1.94"
  get_eip_igw_dependency   = module.create_igw.igw_resource_output
  set_eip_name_tag         = "modular eip"
}

#Import required module to create an ENI
# Fix this later, it is currently getting the value of "get_eni_subnet_id", "get_eni_sg_id". Modify it to allow the user to input this value. 
module "create_eni" {
  source                          = "./eni_module"
  get_eni_subnet_id               = module.create_subnet.subnet_id_output
  set_eni_primary_private_ip_addr = "192.168.1.94"
  get_eni_sg_id                   = module.create_sg.sg_id_output
  set_eni_name_tag                = "modular eni"
}

#Import required module to create a Security Group
module "create_sg" {
  source                = "./sg_module"
  set_sg_name           = "modular webserver sg"
  set_sg_description    = "modular sg for webservers created by terraform"
  get_sg_vpc_id         = module.create_vpc.vpc_id_output
  set_sg_ingress_open   = "0.0.0.0/0"
  set_sg_ingress_custom = "<your public ip here>"
  set_sg_egress_open    = "0.0.0.0/0"
  set_sg_name_tag       = "modular webserver sg"
}

#Import required module to create a Key Pair
module "create_key_pair" {
  source            = "./key_pair_module"
  set_key_pair_name = "modular-key-pair"
}

#Import required module to create an EC2 Instance
module "create_ec2" {
  source                = "./ec2_module"
  set_ec2_ami_id        = "ami-0567f647e75c7bc05"
  set_ec2_instance_type = "t3.medium"
  set_ec2_key_pair_name = module.create_key_pair.key_name_output
  get_ec2_eni_id        = module.create_eni.eni_id_output
  set_ec2_user_data     = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install apache2 -y
  sudo systemctl start apache2
  sudo bash -c 'echo Ubuntu web server launched by Terraform > /var/www/html/index.html'
  EOF 
  set_ec2_name_tag      = "modular ec2 ubuntu webserver"
}
