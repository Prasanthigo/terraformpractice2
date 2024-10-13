variable "cidr_block" {

}

variable "enable_dns_hostnames" {
    default = true
}
 variable "enable_dns_support" {
    default = true
 }

 variable "tags" {
    type = map
    default = {}
 }

# variable "common_tags"{
#     default = {}
#     type = map
# }

# variable "vpc_tags"{
#     default = {}
#     type = map
# }