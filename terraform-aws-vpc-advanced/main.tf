resource "aws_vpc" "main" {
    cidr_block = var.cidr_block
    enable_dns_hostnames = var.enable_dns_hostnames
    enable_dns_support = var.enable_dns_support
    tags = merge(
        var.common_tags,
        {
            Name = var.project_name 
        },
        var.vpc_tags
    )

}

resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id
    tags = merge(
        var.common_tags,
        {
            Name = var.project_name
        },
        var.igw_tags
    )
}

resource "aws_subnet" "public" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr[count.index]
    availability_zone = local.azs[count.index]
    tags = merge(
        var.common_tags,
        {
            Name = "${var.project_name}-public-${local.azs[count.index]}"
        }
    )
    

}
 resource "aws_subnet" "private" {
    count = length(var.private_subnet_cidr)
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr[count.index]
    availability_zone = local.azs[count.index]
    tags = merge(
        var.common_tags,
        {
            Name = "${var.project_name}-private-${local.azs[count.index]}"
        }
    )
 }

 resource "aws_subnet" "database" {
    count = length(var.database_subnet_cidr)
    map_public_ip_on_launch = true
    vpc_id = aws_vpc.main.id
    cidr_block = var.database_subnet_cidr[count.index]
    availability_zone = local.azs[count.index]
    tags = merge(
        var.common_tags,
        {
            Name = "${var.project_name}-database-${local.azs[count.index]}"
        }
    )
 }

 resource "aws_route" "public" {
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
    depends_on = [aws_route_table.public]
 }

 resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }
    tags = merge(
        var.common_tags,
        var.public_route_table_tags,
        {
            Name = "${var.project_name}-public"
        }
    )
 }

 resource "aws_eip" "eip" {
  domain   = "vpc"
}
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(
    var.common_tags,
    {
        Name = var.project_name
    },
    var.nat_gateway_tags
  )
    

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main]
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.main.id
    }
    tags = merge(
        var.common_tags,
        var.private_route_table_tags,
        {
            Name = "${var.project_name}-private"
        },
        var.private_route_table_tags
    )
 }
resource "aws_vpc_peering_connection" "peering" {
    count = var.is_peering_reguired ? 1 : 0
  #peer_owner_id = var.peer_owner_id
  peer_vpc_id   = aws_vpc.main.id #accepter  
  vpc_id        = var.requester_vpc_id #requestor
  auto_accept = true
  tags = merge(
    {
        Name = "VPC Peering between Default and ${var.project_name}"
    },
    var.common_tags
  )
    
  
}





