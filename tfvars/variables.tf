variable "instances" {
    type = map
    default = {
        MongoDB = "t3.medium"
        MYSQL = "t3.medium"
        Redis = "t2.micro"
        RabbitMQ = "t2.micro"
        Catalogue = "t2.micro"
        Payment = "t2.micro"
    }
}

variable "zone_id" {
    default = "Z0220614ND8PFSAQRQUP"
}

variable "ami_id"{
    type = string
    default = "ami-0b4f379183e5706b9"
}

variable "sg_cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "sg_name" {
    default = "allow-all"
    }


