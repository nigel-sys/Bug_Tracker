terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.40.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1" 
  access_key = "ASIATUYJP7SUK7CR57WB"
  secret_key = "tNI8MlGGBBP2snOX+W6JvEWuxazwsu3nmtApeVkF"
}

resource "aws_instance" "foo" {
  ami = "ami-096800910c1b781ba" 
  instance_type = "t2.micro"
}