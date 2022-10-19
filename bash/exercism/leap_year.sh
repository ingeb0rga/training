#!/bin/bash

    # re='^[0-9]+$'
    re='^[[:digit:]]+$'

    if [ $# -ne 1 ] || ! [[ $1 =~ $re ]]; then
        echo "Usage: leap.sh <year>"
        exit 1
    fi
        (( !($1%4) && ($1%100) || !($1%400) )) && echo "true" || echo "false"
    # else
    #     if [ $(($1%400)) -eq 0 ]; then
    #         echo "true"
    #     elif [ $(($1%4)) -eq 0 ]; then
    #         if [ $(($1%100)) -ne 0 ]; then
    #             echo "true"
    #         else
    #             echo "false"
    #         fi
    #     else
    #         echo "false"
    #     fi
    # fi
