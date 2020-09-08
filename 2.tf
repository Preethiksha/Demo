provider "aws" {
  version = "~> 2.0"
  region = "ap-south-1"
}

resource "aws_vpc" "hitech" {
  cidr_block = "172.27.0.0/16"
  
  tags = {
    Name = "hitech"
  }
 }