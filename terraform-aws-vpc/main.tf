resource "aws_vpc" "main" {
    cidr_block = var.cidr_block
    enable_dns_hostnames = var.enable_dns_hostnames
    enable_dns_support = var.enable_dns_support
    tags = var.tags
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = var.igw_tags
}
