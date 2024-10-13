variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "common_tags" {
    default = {
        Project = "Roboshop"
        Env = "DEV"
        Terraform = true
    }
}

variable "vpc_tags" {
    default = {
        Name = "Roboshop"
        
    }
}

variable "internet_gateway_tags" {
    default = {
        Name = "roboshop"
    }
}
