#!/bin/bash

# Creat igw with tags
ws ec2 create-internet-gateway --tag-specifications 'ResourceType=internet-gatewy,Tags=[{Key=Name,Value=<name>}]'

# Attach internet gateway to a VPC
aws ec2 attach-internet-gateway --internet-gateway-id <igw-id> --vpc-id <vpc-id>

# Create route for public subnet through internet gateway
aws ec2 create-route --route-table-id <rtb-id> --destination-cidr-block 0.0.0.0/0 --gateway-id <igw-id>