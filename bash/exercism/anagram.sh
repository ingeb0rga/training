#!/bin/bash

eval "arr=($2)"

for word in "${arr[@]}"; do

	# temp=$(echo "$1" | tr '[:upper:]' '[:lower:]')
	temp=${1,,}
	# candidate=$(echo "$word" | tr '[:upper:]' '[:lower:]')
	candidate=${word,,}
	if [ "$temp" == "$candidate" ]; then
        result=$result
	elif [ ${#1} -eq ${#word} ]; then
		for i in $(seq 1 ${#word}); do
			char=${candidate:i-1:1}
			temp="${temp/$char/}"
		done
	fi

	if [ -z "$temp" ]; then
		result="$result $word"
	fi
done

if [ -z "$result" ]; then
	exit 0
else
    echo $result
fi