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

resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "allow_http_ssh" {
    name = "allow_http_ssh"
    description = "allow tls inbound traffic"
    vpc_id = aws_vpc.main.id
    
    ingress {
        description = "HTTPS from VPC"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
   ingress {
        description = "SSH from my PC"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["35.146.56.64/32"]
    }
    

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "allow_http_ssh.allow_http_ssh"
    }

}

resource "aws_instance" "ec2" {
    ami = "ami-0b4f379183e5706b9"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public.id
    security_groups = [aws_security_group.allow_http_ssh.name]
    associate_public_ip_address = true
    tags = {
        Name = "web"
    }

}