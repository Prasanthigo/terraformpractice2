module "this" {
    source = "../terraform-aws-vpc"
    cidr_block = var.cidr_block
    
    tags = merge(var.common_tags, var.vpc_tags)
    igw_tags = merge(var.common_tags, var.internet_gateway_tags)
}