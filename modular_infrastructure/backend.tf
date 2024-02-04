terraform {
  backend "s3" {
    bucket = "aws-terraform-modular-infra-state-bucket"
    key    = "tf-state/"
    region = "ap-southeast-2"
  }
}