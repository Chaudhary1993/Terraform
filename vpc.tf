#Create AWS VPC
resource "aws_vpc" "levelup_VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"

  tags = {
    Name = "levelup_VPC"
  }
}

#Public subnet
resource "aws_subnet" "levelupvpc-public-1" {
  vpc_id     = aws_vpc.levelup_VPC.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.AWS_REGION}a"

  tags = {
    Name = "levelupvpc-public-1"
  }
}

resource "aws_subnet" "levelupvpc-public-2" {
  vpc_id     = aws_vpc.levelup_VPC.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.AWS_REGION}b"

  tags = {
    Name = "levelupvpc-public-2"
  }
}

resource "aws_subnet" "levelupvpc-public-3" {
  vpc_id     = aws_vpc.levelup_VPC.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.AWS_REGION}c"

  tags = {
    Name = "levelupvpc-public-3"
  }
}

#Private subnet
resource "aws_subnet" "levelupvpc-private-1" {
  vpc_id     = aws_vpc.levelup_VPC.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "${var.AWS_REGION}a"

  tags = {
    Name = "levelupvpc-private-1"
  }
}

resource "aws_subnet" "levelupvpc-private-2" {
  vpc_id     = aws_vpc.levelup_VPC.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "${var.AWS_REGION}b"

  tags = {
    Name = "levelupvpc-private-2"
  }
}

resource "aws_subnet" "levelupvpc-private-3" {
  vpc_id     = aws_vpc.levelup_VPC.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "${var.AWS_REGION}c"

  tags = {
    Name = "levelupvpc-private-3"
  }
}

#Custom Internet Gateway
resource "aws_internet_gateway" "levelup-gw" {
  vpc_id = aws_vpc.levelup_VPC.id

  tags = {
    Name = "levelup-gw"
  }
}

#Routing table for the custom VPC
resource "aws_route_table" "levelup-public" {
    vpc_id = aws_vpc.levelup_VPC.id
    route{
        cidr_block= "0.0.0.0/0"
        gateway_id= aws_internet_gateway.levelup-gw.id
    }
     tags = {
       Name= "levelup-public-1"
     }
}

resource "aws_route_table_association" "levelup-public-1a" {
  subnet_id      = aws_subnet.levelupvpc-public-1.id
  route_table_id = aws_route_table.levelup-public.id
}

resource "aws_route_table_association" "levelup-public-1b" {
  subnet_id      = aws_subnet.levelupvpc-public-2.id
  route_table_id = aws_route_table.levelup-public.id
}

resource "aws_route_table_association" "levelup-public-1c" {
  subnet_id      = aws_subnet.levelupvpc-public-3.id
  route_table_id = aws_route_table.levelup-public.id
}