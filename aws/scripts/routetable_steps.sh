#!/bin/bash

# Create route-table with tags
aws ec2 create-route-table --vpc-id <vpc-id> --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=<name>}]'

# Create tags on route table
#aws ec2 create-tags --resources <rtb-id> --tags Key=Name,Value=<name>

# Associate route table with subnet
aws ec2 associate-route-table --route-table-id <rtb-id> --subnet-id <subnet-id>

# Add route through internet gateway
aws ec2 create-route --route-table-id <rtb-id> --destination-cidr-block <0.0.0.0/0> --gateway-id <igw-id>
