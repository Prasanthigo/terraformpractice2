data "aws_ami" "ami" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["Amazon Linux 2 AMI (HVM) - Kernel 5.10"]
    }
}

output "ami_id" {
    value = data.aws_ami.ami.id
}