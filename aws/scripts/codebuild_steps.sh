#!/bin/bash

# Create a CodeBuild service role
aws iam create-role --role-name CodeBuildServiceRole --assume-role-policy-document file://./roles/create-role.json
aws iam put-role-policy --role-name CodeBuildServiceRole --policy-name CodeBuildServiceRolePolicy --policy-document file://./roles/put-role-policy.json

# Create build project
aws codebuild --debug create-project --name <ProjectName> --source type=CODECOMMIT,location=https://git-codecommit.<path_to_codecommitrepo> --source-version refs/heads/master --artifacts type=NO_ARTIFACTS --environment type=LINUX_CONTAINER,computeType=BUILD_GENERAL1_SMALL,image="aws/codebuild/amazonlinux2-x86_64-standard:4.0" --description <"project_description"> --service-role CodeBuildServiceRole