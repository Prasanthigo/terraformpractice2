resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = "t2.micro"
}

output "aws_instance_info" {
    value = aws_instance.roboshop
}