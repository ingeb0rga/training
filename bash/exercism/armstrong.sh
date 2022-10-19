#!/bin/bash

a=153
declare -i res=0
for i in $(seq 1 ${#a}); do
    # echo ${a:i-1:1}
    res=$res+$((${a:i-1:1}**${#a}))
done

if [ $res -eq $a ]; then
    echo "true"
else
    echo "false"
fi
