#!/bin/bash
sudo yum update -y
sudo yum install -y ruby wget amazon-efs-utils
wget https://aws-codedeploy-eu-central-1.s3.eu-central-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent status