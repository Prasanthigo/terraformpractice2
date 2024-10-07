resource "aws_instance" "roboshop" {
    for_each = var.instances
    ami = var.ami_id
    instance_type = each.value
    tags = {
        Name = each.key
    }
}

output "aws_instance_info" {
    value = aws_instance.roboshop
}