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
  ami = "ami-001c1ab2631f48e96"
  instance_type = "t2.micro"
  key_name = "team15_dependencies"
  tags = {
    Name = "Team15"
  }
  
}

resource "aws_security_group" "AWS-instance" {
  name        = "grant ssh"
  description = "grant ssh"
}
