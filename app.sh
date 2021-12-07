#!/bin/bash

sleep 30

sudo yum update -y


sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -
sudo yum install -y nodejs

sudo yum install unzip -y
cd ~/ && unzip social_something_full.zip
cd ~/social_something_full && npm i --only=prod


sudo mv /tmp/social-smt.service /etc/systemd/system/social-smt.service
sudo systemctl enable social-smt.service
sudo systemctl start social-smt.service

sudo yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
sudo yum install -y mysql-community-server
sudo systemctl start mysqld 

sudo yum install -y awslogs

sudo sed -i "s@log_group_name = /var/log/messages@log_group_name = $LOG_GROUP_NAME@" /etc/awslogs/awslogs.conf
sudo sed -i "s/us-east-1/$REGION/" /etc/awslogs/awscli.conf

sudo systemctl start awslogsd
sudo systemctl enable awslogsd.service
