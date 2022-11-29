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
  region  = "eu-west-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-096800910c1b781ba"
  instance_type = "t2.micro"
  security_groups = ["sg-0677433e497d008b7"]

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
