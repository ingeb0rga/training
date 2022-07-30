#!/bin/bash

# Define variables
group_name="group"

while read user_name
do
  echo "User: $user_name"
  echo
  # Get the list of user policies
  user_policies=$(aws iam list-user-policies --user-name $user_name --query 'PolicyNames[*]' --output text)
  echo "Deleting user $user_name policies: $user_policies"
  for policy in $user_policies ;
  do
    aws iam delete-user-policy --user-name $user_name --policy-name $policy > /dev/null
      if [ $? -eq 0 ]
      then
        echo "Success"
      fi
  done

  # Get the list of attached user policies
  user_attached_policies=$(aws iam list-attached-user-policies --user-name $user_name --query 'AttachedPolicies[*].PolicyArn' --output text)

  echo "Detaching user $user_name attached policies: $user_attached_policies"
  for policy_arn in $user_attached_policies ;
  do
    aws iam detach-user-policy --user-name $user_name --policy-arn $policy_arn > /dev/null
    if [ $? -eq 0 ]
    then
      echo "Success"
    fi
  done

  # Get the list of user groups
  user_groups=$(aws iam list-groups-for-user --user-name $user_name --query 'Groups[*].GroupName' --output text)

  echo "Detaching user $user_name attached group: $user_groups"
  for group in $user_groups ;
  do
    aws iam remove-user-from-group --user-name $user_name --group-name $group > /dev/null
    if [ $? -eq 0 ]
    then
      echo "Success"
    fi
  done

  # Get the list of user access keys
  user_access_keys=$(aws iam list-access-keys --user-name $user_name --query 'AccessKeyMetadata[*].AccessKeyId' --output text)

  echo "Deleting user $user_name access keys: $user_accces_keys"
  for key in $user_access_keys ;
  do
    aws iam delete-access-key --user-name $user_name --access-key-id $key > /dev/null
    if [ $? -eq 0 ]
    then
      echo "Success"
    fi    
  done

  echo "Deleting user $user_name login profile"
  aws iam delete-login-profile --user-name $user_name  > /dev/null
  if [ $? -eq 0 ]
  then
    echo "Success"
  fi
  echo "Deleting user: $user_name"
  aws iam delete-user --user-name $user_name  > /dev/null
  if [ $? -eq 0 ]
  then
    echo "Success"
  fi
  echo
done < user_list.txt

# Delete user group

# Get the list of attached group policies
attached_policies=$(aws iam list-attached-group-policies --group-name "$group_name" --query 'AttachedPolicies[*].PolicyArn' --output text)
for policy_arn in $attached_policies ;
do
  echo "Deleting policy $policy_arn from group $group_name"
  aws iam detach-group-policy --group-name "$group_name" --policy-arn "$policy_arn"  > /dev/null
  if [ $? -eq 0 ]
  then
    echo "Success"
  fi
done

# Delete group
echo "Deleting group: $group_name"
aws iam delete-group --group-name "$group_name"  > /dev/null
if [ $? -eq 0 ]
then
  echo "Success"
fi