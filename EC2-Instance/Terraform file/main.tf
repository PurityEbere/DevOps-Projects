provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0f70bf4f0fcdf2ab1" 
  instance_type = "t3.micro"
}
