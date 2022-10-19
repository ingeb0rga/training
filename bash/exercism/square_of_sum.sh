#!/bin/bash

# for ((i=1; i<=$2; i++)); do
#     (( sum_of_squares+=$((i**2)) ))
#     (( sum+=i ))
# done
# square_of_sum=$((sum**2))
# diff=$((square_of_sum-sum_of_squares))

# case $1 in
#     "difference") echo $diff;;
#     "square_of_sum") echo $square_of_sum;;
#     "sum_of_squares") echo $sum_of_squares;;
# esac

function square_of_sum(){
	number="$1"
	echo "$(((number*(number+1)/2)**2))"
}
function sum_of_squares(){
	number="$1"
	echo "$((number*(number+1)*(2*number+1)/6))"
}
function difference(){
	difference="$(($(square_of_sum $1) - $(sum_of_squares $1)))"
	echo "$difference" 
}
eval "$1 $2"