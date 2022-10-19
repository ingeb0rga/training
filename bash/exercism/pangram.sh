#!/bin/bash

a="abcdefghijklmnopqrstuvwxyz"
b="The quick brown fox jumps over the lazy do."
b=$(echo $b | tr '[:upper:]' '[:lower:]')

for i in $(seq 1 ${#b}); do
    a="${a//${b:i-1:1}/}"
done

if [ -z $a ]; then
    echo "true"
else
    echo "false"
fi
