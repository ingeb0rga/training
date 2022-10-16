#!/bin/bash

plain="abcdefghijklmnopqrstuvwxyz"
cipher=${plain:$2}${plain:0:$2}

for ((i=0; i<${#1}; i++)); do
    if [[ ${1:i:1} == [[:lower:]] ]]; then
        index=$(echo $plain | grep -ob "${1:i:1}" | grep -oE '[0-9]+')
        res+=${cipher:index:1}
    elif [[ ${1:i:1} == [[:upper:]] ]]; then
        index=$(echo $plain | tr '[:lower:]' '[:upper:]' | grep -ob "${1:i:1}" | grep -oE '[0-9]+')
        res+=$(echo ${cipher:index:1} | tr '[:lower:]' '[:upper:]')
    else
        res+=${1:i:1}
    fi
done
echo $res