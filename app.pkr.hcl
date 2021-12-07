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

variable "region" {
    type = string
    description = "The AWS region to make AMI in"
    default = "us-west-2"
}

variable "log_group_name" {
    type = string
    description = "The name of the log group in CloudWatch"
    default = "social-something-loggers"
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
    region = "${var.region}"
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

    provisioner "shell" {
        script = "./app.sh"
        environment_vars = [
            "REGION=${var.region}",
            "LOG_GROUP_NAME=${var.log_group_name}"
        ]
    }
}