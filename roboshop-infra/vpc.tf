module "this" {
    source = "../terraform-aws-vpc"
    cidr_block = var.cidr_block
    
    tags = merge(var.common_tags, var.vpc_tags)
    igw_tags = merge(var.common_tags, var.internet_gateway_tags)
    public_subnet_cidr = var.public_subnet_cidr
    azs = var.azs
    public_subnet_names = var.public_subnet_names
    private_subnet_cidr = var.private_subnet_cidr
    private_subnet_names = var.private_subnet_names

    # database
    database_subnet_cidr = var.database_subnet_cidr
    database_subnet_names = var.database_subnet_names
    public_route_table_tags = var.public_route_table_tags
    private_route_table_tags = var.private_route_table_tags
    database_route_table_tags = var.database_route_table_tags


}
    
        


