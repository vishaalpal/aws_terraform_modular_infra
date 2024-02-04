# Import the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  shared_config_files = "Users/vishaalpal/.aws/config"
  shared_credentials_files = "/Users/vishaalpal/.aws/credentials"
  profile                 = "vishaalpal"
}
