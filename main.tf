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
  key_name   = "team15"
  public_key = tls_private_key.AWS-instance.public_key_openssh
}

resource "aws_instance" "AWS-instance" {
  count = 1 
  ami = "ami-096800910c1b781ba"
  instance_type = "t2.micro"
  key_name = aws_key_pair.generated_key.key_name
  tags = {
    Name = "Team15"
  }
}

resource "aws_eip" "ip" {
  instance = "$(aws_instance.AWS-instance.id)"
  depends_on = [
    "aws_instance.AWS-instance"
  ]
}

provisioner "remote-exec" {
  command = "echo ${aws_instance.AWS-instance.public_key_openssh} > ip_address.txt"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
