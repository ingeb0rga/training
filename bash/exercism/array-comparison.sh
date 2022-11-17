#!/bin/bash
a=(3 5 8 7 10 6)
b=(6 5 3 4 12)
c=(14 7 5 6 7 3)

res=()

for aa in "${a[@]}"; do
    for bb in "${b[@]}"; do
        for cc in "${c[@]}"; do
            # check if value is in all arrays
            if [ "$cc" -eq "$bb" ] && [ "$bb" -eq "$aa" ]; then
                # if value already exists in the result array then don't add
                if ! echo "${res[@]}" | grep -q "$cc"; then
                    res+=("$cc")
                fi
	        fi    
        done
    done
done

echo "${res[@]}"
