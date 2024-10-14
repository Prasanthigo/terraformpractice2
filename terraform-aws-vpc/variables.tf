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

variable "common_tags"{
    default = {}
    type = map
}

# variable "vpc_tags"{
#     default = {}
#     type = map
# }
variable "igw_tags" {
    type = map
    default = {}
 }
  variable "public_subnet_cidr" {

  }

#   variable "public_subnet_tags" {

#   }

  variable "azs" {
    type = list(string)

  }

  variable "public_subnet_names" {
    type = list(string)

  }

  variable "private_subnet_cidr" {

  }

  variable "private_subnet_names" {

  }

  variable "database_subnet_cidr" {

  }

  variable "database_subnet_names" {

  }



  