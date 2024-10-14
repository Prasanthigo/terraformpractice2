module "vpc" {
    source = "../terraform-aws-vpc-advanced"
    cidr_block = var.cidr_block
    project_name = var.project_name
    common_tags = var.common_tags
}