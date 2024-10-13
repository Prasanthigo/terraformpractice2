module "this" {
    source = "../terraform-aws-vpc"
    cidr_block = var.cidr_block
    
    tags = merge(var.common_tags, var.vpc_tags)
}