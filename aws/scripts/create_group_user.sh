#!/bin/bash

# Define variables
group_name="group"
password="Pass1234"
key="key"
value="value"

# Create group
echo "Creating group: $group_name"
aws iam create-group --group-name "$group_name"  > /dev/null
if [ $? -eq 0 ]
then
  echo "Success"
fi

# Read policy-arn list from file and attach to group
while read policy_arn
do
  # Attach policy
  echo "Attaching policy $policy_arn to group $group_name"
  aws iam attach-group-policy --policy-arn "$policy_arn" --group-name "$group_name"  > /dev/null
  if [ $? -eq 0 ]
  then
    echo "Success"
  fi
done < group_policy_list.txt

while read user_name
do
  echo "Creating user: $user_name"
  aws iam create-user --user-name "$user_name" --tags Key="$key",Value="$value" > /dev/null
  if [ $? -eq 0 ]
  then
    echo "Success"
  fi
  echo "Adding user $user_name to group $group_name"
  aws iam add-user-to-group --user-name "$user_name" --group-name "$group_name"  > /dev/null
  if [ $? -eq 0 ]
  then
    echo "Success"
  fi  
  echo "Creating login profile and initial password for user: $user_name"
  aws iam create-login-profile --user-name "$user_name" --password "$password" --password-reset-required  > /dev/null
  if [ $? -eq 0 ]
  then
    echo "Success"
  fi  
  echo "Allowing user $user_name to change password"
  aws iam attach-user-policy --user-name "$user_name" --policy-arn arn:aws:iam::aws:policy/IAMUserChangePassword  > /dev/null
  if [ $? -eq 0 ]
  then
    echo "Success"
  fi
  echo "Creating access key for user: $user_name"
  aws iam create-access-key --user-name "$user_name"  > /dev/null
  if [ $? -eq 0 ]
  then
    echo "Success"
  fi  
done < user_list.txt