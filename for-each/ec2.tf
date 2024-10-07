resource "aws_instance" "roboshop" {
    for_each = var.instances
    ami = var.ami_id
    instance_type = each.value
    tags = {
        Name = each.key
    }
}

# output "aws_instance_info" {
#     value = aws_instance.roboshop
# }
resource "aws_route53_record" "www" {
    for_each = var.instances
    zone_id = var.zone_id
    name = "${each.key}.hetvik.online"
    type = "A"
    ttl = 1
    records = [each.key == "payment" ? each.value.public_ip : each.value.private_ip]
}

