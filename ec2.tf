provider "aws" {
    access_key = ""
    secret_key = ""
    region = "us-east-1"
}

resource "aws_instance" "TerraformEC2Instance" {
  ami           = "ami-09d95fab7fff3776c"
  instance_type = "t2.micro"
  tags = {
    Name = "TerraformEC2"
  }
}

resource "aws_vpc" "terraform_vpc" {
  cidr_block       = "190.160.0.0/16"
  instance_tenancy = "deault"

  tags = {
    Name = "Terraform VPC"
    Location = "US East 1"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = "${aws_vpc.terraform_vpc.id}"
  cidr_block = "190.160.1.0/24"

  tags = {
    Name = "Subnet 1"
  }
}