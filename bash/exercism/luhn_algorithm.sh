#!/bin/bash

re='^[[:digit:]]+$'
a=$(echo $1 | sed 's/ //g')

declare -i sum
sum=0

if ! [[ $a =~ $re ]]; then
    echo "false"
    # exit 1
else
    for ((i=${#a}-2; i>=0; i=i-2)); do
        n=$((${a:i:1}*2))
        if [ $n -gt 9 ]; then
            sum=$(($sum+$(($n-9))))
        else
            sum=$(($sum+$n))
        fi
    done
    for ((i=${#a}-1; i>=0; i=i-2)); do
        sum=$(($sum+${a:i:1}))
    done

    if [ $sum -eq 0 ] && [ ${#a} -eq 1 ]; then
        echo "false"
    elif [ $(($sum%10)) -eq 0 ]; then
        echo "true"
    else
        echo "false"
    fi
fi
