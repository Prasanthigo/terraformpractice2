module "vpc" {
    source = "../../terraform-aws-vpc-advanced"
    project_name = var.project_name
    cidr_block = var.cidr_block
    common_tags = var.common_tags
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    database_subnet_cidr = var.database_subnet_cidr
    #peering configuration
    is_peering_reguired = true
    requester_vpc_id = data.aws_vpc.default.id
}