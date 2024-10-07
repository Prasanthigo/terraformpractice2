variable "ami_id"{
    type = string
    default = "ami-0b4f379183e5706b9"
}

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