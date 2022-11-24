resource "aws_instance" "foo" {
  ami = "ami-096800910c1b781ba" 
  instance_type = "t2.micro"
}