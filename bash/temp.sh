#!/bin/bash

for ((i=0; i<${#1}; i++)); do
    case ${1:i:1} in
        "A") a+=1;;
        "C") c+=1;;
        "G") g+=1;;
        "T") t+=1;;
        *) echo "Invalid nucleotide in strand" && exit 1;;
    esac
done
echo "A: ${#a}"
echo "C: ${#c}"
echo "G: ${#g}"
echo "T: ${#t}"