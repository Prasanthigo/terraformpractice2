# data "aws_ami" "ami" {
#     most_recent = true
#     owners = ["amazon"]

#     filter {
#         name = "name"
#         values = ["Amazon Linux 2 AMI (HVM) - Kernel 5.10"]
#     }
# }

# output "ami_id" {
#     value = data.aws_ami.ami.id
# }

data "aws_vpc" "default" {
    default = true
}

output "vpc_info" {
    value = data.aws_vpc.default
}

resource "aws_security_group" "allow-http" {
    name = "sg1"
    vpc_id = data.aws_vpc.default.id
    ingress {
        description = "Allow all inbound"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}