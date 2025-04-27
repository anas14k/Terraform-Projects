# VPC Creation
resource "aws_vpc" "main_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        name = "main_vpc"
    }
}

# Public Subnet 1
resource "aws_subnet" "public_subnet_1" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.public_subnet_1_cidr
    availability_zone = var.availability_zone_1
    map_public_ip_on_launch = true
    tags = {
      name = "public_subnet_1"
    } 
}

# Public Subnet 2
resource "aws_subnet" "public_subnet_2" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.public_subnet_2_cidr
    availability_zone = var.availability_zone_2
    map_public_ip_on_launch = true
    tags = {
      name = "public_subnet_2"
    }
}

# Private Subnet 1
resource "aws_subnet" "private_subnet_1" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.private_subnet_1_cidr
    availability_zone = var.availability_zone_1
    tags = {
      name = "private_subnet_1"
    }
}

# Private Subnet 2
resource "aws_subnet" "private_subnet_2" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.private_subnet_2_cidr
    availability_zone = var.availability_zone_2
    tags = {
      name = "private_subnet_2"
    }
}

# Internet Gateway 
resource "aws_internet_gateway" "main_gateway" {
    vpc_id = aws_vpc.main_vpc.id
    tags = {
        name = "main_gateway"
    }
}

# NAT Gateway (for private subnet to access the internet)
resource "aws_nat_gateway" "main_nat" {
    allocation_id = aws_eip.main_nat.id
    subnet_id = aws_subnet.private_subnet_1.id
    tags = {
        name = "main_nat"
    }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "main_nat" {
    domain = "vpc"

}

# Route Tables and Routes
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.main_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main_gateway.id

    }
    tags = {
      name = "public_route_table"
    }
  
}

resource "aws_route_table_association" "public_route_assoc_1" {
    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.public_route_table.id
  
}

resource "aws_route_table_association" "public_route_assoc_2" {
    subnet_id = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.public_route_table.id
  
}

# Private Route Tables
resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.main_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.main_nat.id
    }
    tags = {
      name = "private-route-table"
    }
  
}

resource "aws_route_table_association" "private_route_assoc_1" {
    subnet_id = aws_subnet.private_subnet_1.id
    route_table_id = aws_route_table.private_route_table.id
  
}

resource "aws_route_table_association" "private_route_assoc_2" {
    subnet_id = aws_subnet.private_subnet_2.id
    route_table_id = aws_route_table.private_route_table.id
  
}