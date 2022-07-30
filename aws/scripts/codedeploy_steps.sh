#!/bin/bash

# Create a bucket and enable versioning
aws s3 mb s3://<unique_bucket_name>
aws s3api put-bucket-versioning --bucket <unique_bucket_name> --versioning-configuration Status=Enabled

# Create EC2 role to access S3 for codedeploy
aws iam create-role --role-name EC2RoleForCodeDeploy --assume-role-policy-document file://./roles/S3policy.json
aws iam attach-role-policy --role-name EC2RoleForCodeDeploy --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

# Create codedeploy role
aws iam create-role --role-name CodeDeployRole --assume-role-policy-document file://./roles/CodeDeploy.json
aws iam attach-role-policy --role-name CodeDeployRole --policy-arn arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole

# Create security group and inbound rules
aws ec2 create-security-group --group-name <name> --description "My security group"
aws ec2 authorize-security-group-ingress --group-name <name> --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name <name> --protocol tcp --port 22 --cidr 0.0.0.0/0

# Create and run instance(s)
aws ec2 run-instances --image-id ami-0a1ee2fb28fe05df3 --count <instances q-ty> --instance-type t2.micro --key-name <name> --tag-specifications 'ResourceType=instance,Tags=[{Key=<name>,Value=<value>}, {Key=<key>,Value=<value>}]' --security-groups <name> [--user-data file://./scripts/user_data.sh] --iam-instance-profile Name=EC2RoleForCodeDeploy

# Create deploy application
aws deploy create-application --application-name <application_name>

# Create deployment group
aws deploy create-deployment-group --application-name <application_name> --deployment-group-name <deployment_group_name> --service-role-arn <arn:aws:iam::xxxxxxxxxx:role/CodeDeployRole>

# Deploy the files into S3 (.zip archive)
aws deploy push --application-name <application_name> --s3-location s3://<unique_bucket_name>/<path_to>/<name.zip> --ignore-hidden-files

# Create deployment
aws deploy create-deployment --application-name <application_name> --s3-location bucket=<unique_bucket_name>,key=<path_to>/<name.zip>,bundleType=zip --deployment-group-name <deployment_group_name>