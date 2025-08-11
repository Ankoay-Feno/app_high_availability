resource "aws_vpc" "main" {
    cidr_block = var.cidr_block
    tags = {
        Name = var.vpc_name
    }

}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = var.inet_gateway
    }
}

locals {
  public_subnets = {
    "a" = { az = "eu-west-2a", cidr = "10.0.1.0/24" }
    "b" = { az = "eu-west-2b", cidr = "10.0.2.0/24" }
  }
}

resource "aws_subnet" "public_subnet" {
  for_each = local.public_subnets
  
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags = {
    Name = "Public Subnet ${each.key}"
  }
}


resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "PublicRouteTable"
    }
}

resource "aws_route_table_association" "public_subnet_association" {
    for_each = aws_subnet.public_subnet
    subnet_id = each.value.id
    route_table_id = aws_route_table.public_route_table.id
}