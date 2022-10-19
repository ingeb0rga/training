#!/bin/bash

declare -A colors
colors=(["black"]=0 ["brown"]=1 ["red"]=2 ["orange"]=3 ["yellow"]=4 ["green"]=5 ["blue"]=6 ["violet"]=7 ["grey"]=8 ["white"]=9)

if [[ -z ${colors[$1]} ]] || [[ -z ${colors[$2]} ]]; then
    echo "invalid color"
    exit 1
elif [ $1 == "black" ]; then
    echo "${colors[$2]}"
else
    echo "${colors[$1]}${colors[$2]}"
fi
