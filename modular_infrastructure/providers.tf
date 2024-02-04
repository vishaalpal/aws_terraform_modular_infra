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
  region                  = "ap-southeast-2"
  shared_credentials_file = "/Users/vishaalpal/.aws/credentials"
  profile                 = "vishaalpal"
}
