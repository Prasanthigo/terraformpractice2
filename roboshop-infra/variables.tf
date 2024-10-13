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

variable "public_subnet_cidr" {
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
    default = ["us-east-1a", "us-east-1b"]
}
 
variable "public_subnet_names" {
    default = ["roboshop-public-1a","roboshop-public-1b"]
    

}
