# output "vpc_id" {
#     value = module.vpc.vpc_id #module.name.output variable name
# }

output "azs" {
    value = module.vpc.azs
}

output "public_subnet_ids" {
    value = module.vpc.public_subnet_ids
}