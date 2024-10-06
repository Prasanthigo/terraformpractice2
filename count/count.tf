resource "aws_instance" "conditions" {
    count = 7
    ami = var.ami_id
    instance_type = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "Mysql" ? "t3.medium" : "t2.micro"
    tags = {
        Name = var.instance_names[count.index]
    }
}
resource "aws_route53_record" "record" {
    count = 7
    zone_id = var.zone_id
    name = "${var.instance_names[count.index]}.hetvik.online"
    type = "A"
    ttl = 1
    records = [aws_instance.conditions[count.index].public_ip]
}

resource "aws_key_pair" "deployer" {
    key_name = "devops.pem"
    public_key = file("${path.module}/devops.pem")
}

