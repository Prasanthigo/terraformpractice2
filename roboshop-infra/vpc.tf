module "this" {
    source = "../terraform-aws-vpc"
    cidr_block = var.cidr_block
    
    tags = merge(var.common_tags, var.vpc_tags)
    igw_tags = merge(var.common_tags, var.internet_gateway_tags)
    public_subnet_cidr = var.public_subnet_cidr
    azs = var.azs
    public_subnet_names = var.public_subnet_names
}
    
        


