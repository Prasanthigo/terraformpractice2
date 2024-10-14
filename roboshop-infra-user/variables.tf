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