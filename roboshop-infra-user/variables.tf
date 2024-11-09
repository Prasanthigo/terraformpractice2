variable "project_name" {
    default = "Roboshop"
}

variable "cidr_block" {
    default ="10.0.0.0/16"
}

variable "common_tags" {
    default = {
        Name = "Roboshop"
        Env = "Dev"
        Terraform = true
    }
}
variable "public_subnet_cidr" {
    default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "private_subnet_cidr" {
    default = ["10.0.11.0/24", "10.0.12.0/24"]
}
variable "database_subnet_cidr" {
    default = ["10.0.16.0/24", "10.0.17.0/24"]
}