#!/bin/bash


events=(wink 'double blink' 'close your eyes' jump)
((reverse = $1 >> 4 & 1))

echo $reverse

	# s="$(echo "obase=2;$1" | bc)"
	# echo $s

	# answer=("jump" "close your eyes" "double blink" "wink")

	# if [ ${#s} -eq 5 ] && [ ${s:0:1} -eq 1 ]; then
		
	# 	for((i=3; i>=0; i--)); do
	# 		if [ ${s:i:1} -eq 1 ]; then
	# 			handshake="${answer[i]},$handshake"
	# 		else
	# 			handshake="${answer[$((i-3))]},$handshake"
	# 		fi
	# 	done

	# else

	# 	for((i=0; i<=$((${#s}-1)); i++)); do
	# 		if [ ${s:i:1} -eq 1 ]; then
	# 			handshake="${answer[((i-${#s}))]},$handshake"

	# 		fi
	# 	done
		
	# fi

	# echo "${handshake::-1}"