#!/bin/bash

n=100
declare -A res
res=(["1"]=0 ["2"]=0 ["3"]=0 ["4"]=0 ["5"]=0 ["6"]=0 ["7"]=0 ["8"]=0 ["9"]=0 ["10"]=0)
i=1
x=0

while [ $i -le $n ]; do
  x=$(( (RANDOM % 10) + 1))
  res[$x]=$(( ${res[$x]} + 1))
  ((i++))
done

echo "1:" ${res['1']}
echo "2:" ${res['2']}
echo "3:" ${res['3']}
echo "4:" ${res['4']}
echo "5:" ${res['5']}
echo "6:" ${res['6']}
echo "7:" ${res['7']}
echo "8:" ${res['8']}
echo "9:" ${res['9']}
echo "10:" ${res['10']}
