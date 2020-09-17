provider "aws" {
  version = "~> 2.0"
  region = "ap-south-1"
}

resource "aws_vpc" "hitech" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "hitech"
  }
 }
 
resource "aws_subnet" "hitech1" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.hitech.id
  
  tags = {
    Name = "hitech1"
  }
 }
 
resource "aws_internet_gateway" "hitech2" {
  vpc_id = aws_vpc.hitech.id
  
  tags = {
    Name = "hitech2"
  }
 }
  
resource "aws_route_table" "hitech3" {
  vpc_id = aws_vpc.hitech.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hitech2.id
  }
} 
resource "aws_route_table_association" "hitech4" {
  subnet_id      = aws_subnet.hitech1.id
  route_table_id = aws_route_table.hitech3.id
} 
