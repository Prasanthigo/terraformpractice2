# output "vpc_id" {
#     value = module.vpc.vpc_id #module.name.output variable name
# }

output "azs" {
    value = module.vpc.azs
}