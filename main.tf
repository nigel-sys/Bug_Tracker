terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "AWS-instance" {
  count = 1 
  ami = "ami-096800910c1b781ba"
  key_name = "x21179158"
  instance_type = "t2.micro"
  tags = {
    Name = "Node1"
  }
