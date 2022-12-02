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
  ami = "ami-001c1ab2631f48e96"
  instance_type = "t2.micro"
  key_name = aws_key_pair.generated_key.key_name
  tags = {
    Name = "Team15"
  }
  provisioner "remote-exec" {
    inline = [
"source newenv/bin/activate",
"sudo git clone https://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@github.com/nigel-sys/Bug_Tracker.git",
"cd Bug_Tracker",
"cd BugRnT/",
"python3 manage.py runserver 8000"
    ]

    connection {
      type        = "ssh"
      private_key = "${tls_private_key.AWS-instance.private_key_pem}"
      user        = "ec2-user"
      timeout     = "1m"
      host = self.public_ip
    }
  }
}

resource "aws_security_group" "AWS-instance" {
  name        = "grant ssh"
  description = "grant ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
