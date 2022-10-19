#!/bin/bash

text="$(echo "$1" | sed 's/[^a-zA-Z0-9]//g' | tr '[:upper:]' '[:lower:]')"

declare -A dict

for ((i=0;i<${#text};i++)); do
	char=${text:i:1}
	if [ -v dict[$char] ]; then
		echo "false"
		exit 0
	else
		dict[$char]=1
	fi
done

echo "true"
