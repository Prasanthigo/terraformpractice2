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