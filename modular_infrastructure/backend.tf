terraform {
  backend "s3" {
    bucket = "aws-terraform-modular-infra-state-bucket"
    key    = "/"
    region = "ap-southeast-2"
  }
}