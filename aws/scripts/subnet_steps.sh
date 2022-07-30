#!/bin/bash

# Create subnet with tags
aws ec2 create-subnet --vpc-id <vpc-id> --cidr-block <x.x.x.x/xx> --availability-zone <eu-central-1b> --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=<name>}]'

# Creat tags for subnet
#aws ec2 create-tags --resources <subnet-id> --tags Key=Name,Value=<name>