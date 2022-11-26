terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
  access_key = AWS_ACCESS_KEY_ID
  secret_key = AWS_SECRET_ACCESS_KEY
}

resource "aws_instance" "app_server" {
  ami           = "ami-096800910c1b781ba"
  instance_type = "t2.micro"
}