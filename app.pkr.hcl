packer {

    required_plugins {
        amazon = {
            version = ">= 1.0.0"
            source = "github.com/hashicorp/amazon"
        }
    }
}

locals {
    timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "social-smt" {

    ami_name = "social-something-${local.timestamp}"


    source_ami_filter {
        filters = {
            name                = "amzn2-ami-hvm-2.*.1-x86_64-gp2"
            root-device-type    = "ebs"
            virtualization-type = "hvm"
        
        }
        most_recent = true
        owners      = ["amazon"]
    }

    instance_type = "t2.micro"
    region = "us-west-2"
    ssh_username = "ec2-user"
}

build {

    sources = [
        "source.amazon-ebs.social-smt"
    ]


    provisioner "file" {
        source = "../social_something_full.zip"
        destination = "/home/ec2-user/social_something_full.zip"
    }

    provisioner "file" {
        source = "./social-smt.service"
        destination = "/tmp/social-smt.service"
    }

}