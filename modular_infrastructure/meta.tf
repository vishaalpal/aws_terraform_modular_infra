terraform {
  backend "s3" {
    bucket = "aws-terraform-modular-infra-state-bucket"
    key    = "<BRANCH_NAME>/terraform.tfstate"
    region = "ap-southeast-2"
  }
}