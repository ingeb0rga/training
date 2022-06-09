#!/bin/bash

# Checking for mandatory positional argument. Exit with help message, if input file is omitted or not valid
if [ -z $@  ]; then
  echo "Error! Please use the script with a path to the input file (eg: ./task1.sh ./accounts.csv)"
  exit 1
elif [ ! -f $@ ]; then
  echo "Error! Wrong path or file is missing."
  exit 1
fi

# Replacing symbol combinations, that interfere to normal columns splitting, and assign the result to variable
temp_file=$(cat $* | sed 's|, |___|g')

# Array of "id" column
readarray -t arr_id < <(echo "$temp_file" | tail -n +2 | cut -d ',' -f1)
# Array of "location_id" column
readarray -t arr_l_id < <(echo "$temp_file" | tail -n +2 | cut -d ',' -f2)
# Array of "name" column, formatted as required ("Name Sirname")
readarray -t arr_name < <(echo "$temp_file" | tail -n +2 | cut -d ',' -f3 | sed 's|\b\(.\)/|u\1|g')
# Array of "title" column
readarray -t arr_title < <(echo "$temp_file" | tail -n +2 | cut -d ',' -f4)

# Optional method of getting correct "title" field, if csvkit is installed.
# No need to replace ", " with "___" at the beginning and at the end of this script
#readarray -t arr_title < <(echo "$temp_file" | tail -n +2 | csvcut -c 4)

# Array of "department" column
readarray -t arr_dep < <(echo "$temp_file" | tail -n +2 | cut -d ',' -f6)

# Filling array of "email" column with emails formatted as required
for (( i=0; i<${#arr_name[@]}; i++ )); do
# Fist letter of name to lowercase
  first=$(echo ${arr_name[$i]:0:1} | awk '{print tolower($0)}')
# Sirname to lowercase
  sirname=$(echo ${arr_name[$i]} | cut -d ' ' -f2 | awk '{print tolower($0)}')
# Adding values into array of "email" column
  arr_email+=( "$first$sirname" )	# Concatenating email (without adding domain and checking for coincidences) and adding to array
done

# Checking if emails are unique.
# arr_uniq is a temporary associated array of emails and attributes of uniqueness.
# If email is unique, it is assigned the value "1", if not unique - the value "2".
declare -A arr_uniq
for email in "${arr_email[@]}"; do
  if [ -z ${arr_uniq[$email]} ]; then
	arr_uniq[$email]=1
  else
	arr_uniq[$email]=2
  fi
done

# Formatting emails as required, adding location_id (where needed) and domain
for (( i=0; i<(${#arr_email[@]}); i++ )); do
  email=${arr_email[$i]}
# Testing if email is unique
  if [[ ${arr_uniq[$email]} -eq 2 ]]; then
	arr_email[$i]="${arr_email[$i]}${arr_l_id[$i]}@abc.com"
  else 
	arr_email[$i]="${arr_email[$i]}@abc.com"
  fi
done

# Formattinging the path to the converted file
new_file=$(echo $* | sed 's|accounts|accounts_new|g')

# Importing raw header line into converted file
head -n 1 $* > $new_file

# Importing converted data into converted file per line
for (( i=0; i<${#arr_id[@]}; i++ )); do
  echo "${arr_id[$i]},${arr_l_id[$i]},${arr_name[$i]},${arr_title[$i]},${arr_email[$i]},${arr_dep[$i]}" >> $new_file
done

# Returning the peplaced symbol combinations, that interfered to normal columns splitting
sed -i 's|___|, |g' $new_file