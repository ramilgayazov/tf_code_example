terraform {
  backend "s3" {
    bucket = "voxxify-terraform-states"
    region = "eu-west-1"
  }
}


provider "aws" {
  region     = "eu-west-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
