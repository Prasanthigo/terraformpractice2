module "this" {
    source = "../terraform-aws-vpc"
    cidr_block = var.cidr_block
    common_tags = var.common_tags
    vpc_tags = var.vpc_tags
    tags = merge(var.common_tags, var.vpc_tags)
}