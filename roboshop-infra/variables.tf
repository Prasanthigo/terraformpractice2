variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "tags" {
    default = {
        Name = "Roboshop"
        Env = "DEV"
        Terraform = true
    }
}