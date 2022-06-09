#!/bin/bash

# Checking for mandatory positional argument. Exitting with help message, if input file is omitted or not valid
if [ -z $@ ]; then
  echo "Error! Please use the script with a path to the input file (eg: ./task2.sh ./output.txt)."
  exit 1
elif [ ! -f $@ ]; then
  echo "Error! Wrong path or file is missing."
  exit 1
fi

# Parsing "testName" value
testName=$(cat $* | head -n1 | awk -F "," '{print $1}' | sed 's|\[ ||g;s| \]||g')
# Parsing "success" value
success=$(cat $* | tail -n1 | awk '{print $1}')
# Parsing "rating" value
rating=$(cat $* | tail -n1 | awk '{print $11}' | sed 's|%,||g')
# Parsing all tests "duration" value
duration_total=$(cat $* | tail -n1 | awk -F " " '{print $NF}')
# Parsing "failed" value
failed=$(cat $* | tail -n1 | awk '{print $6}')

# Array of "status" of each test
# Renaming the first "ok" to "true", "not ok" to "false"
readarray -t statuses < <(cat $* | sed 's/not ok/false/g;s/ok/true/1' | \
head -n -2 | tail -n +3 | awk '{print $1}')

# Array of "duration" of each test
readarray -t durations < <(cat $* | head -n -2 | tail -n +3 | awk -F " " '{print $NF}')

# Array of "name" of each test
# Renaming "not ok" to "notok". This let "names" start from the same field in every line of text, after splitting.
readarray -t names < <(cat $* | sed 's|not ok|notok|1' | head -n -2 | tail -n +3 | \
awk '{for(i=3;i<=NF-1;i++) printf $i" "; print ""}' | sed 's|\(.*\), |\1|')

# Parsing all "key: value" pairs for all tests into "tests" array
tests=()
for (( i=0; i<(${#statuses[@]}); i++ )); do
  printf -v test ' {\n   "name": "%s",\n   "status": %s,\n   "duration": "%s"\n  },\n'\
   "${names[$i]}" "${statuses[$i]}" "${durations[$i]}"
  tests+=( "$test" )
done

# Removing the last "," in "tests" array for propper JSON format
tests[${#tests[@]} - 1]=$(printf "${tests[${#tests[@]} - 1]}" | sed 's|\(.*\)},|\1}|')

# Formattinging the path to the converted file
new_file=$(echo $* | sed 's|\(.*\)txt|\1json|')

# Saving JSON formatted data into "output.json" file
printf '{\n "testName": "%s",\n "tests": [\n%s\n ],\n "summary": {\n  "success": %s,\n  "failed": %s,\n  "rating": %s,\n  "duration": "%s"\n }\n}' \
"$(echo $testName)" "${tests[*]}" "$(echo $success)" "$(echo $failed)" "$(echo $rating)" "$(echo $duration_total)" >$new_file