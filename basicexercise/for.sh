#!/bin.bash
declare -x sum=0
for i in {1..100};do
	let sum+=i
done
echo sum=$sum
