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

resource "tls_private_key" "AWS-instance" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "21179158"
  public_key = tls_private_key.AWS-instance.public_key_openssh
}

resource "aws_instance" "AWS-instance" {
  count = 1 
  ami = "ami-096800910c1b781ba"
  instance_type = "t2.micro"
  tags = {
    Name = "Team15"
  }
}
