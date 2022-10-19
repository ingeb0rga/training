#!/bin/bash

if [[ $(bc <<< "$2+$3 <= $4 || $2+$4 <= $3 || $3+$4 <= $2 || $2*$3*$4 == 0") -eq 1 ]]; then
	echo "false"
else
	case $1 in
		equilateral)
			(( $(bc <<< "$2 == $3 && $3 == $4") )) && echo "true" || echo "false";;
		isosceles)
			(( $(bc <<< "$2 == $3 || $2 == $4 || $3 == $4") )) && echo "true" || echo "false";;
		scalene)
			(( $(bc <<< "$2 != $3 && $3 != $4 && $2 != $4") )) && echo "true" || echo "false"
	esac
fi