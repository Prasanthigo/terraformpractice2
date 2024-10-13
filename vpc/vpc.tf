resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Roboshop"
        Environment = "DEV"
        terraform = true
    }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "Roboshop-public"
    }
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    tags = {
        Name = "Roboshop-private"
    }
}
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "Roboshop"
    }
}
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "Public-RT"
    }
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id
    
    tags = {
        Name = "Private-RT"
    }
}