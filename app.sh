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
