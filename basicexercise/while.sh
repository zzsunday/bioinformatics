#!/bin/bash

declare -i sum=0
i=1
while [ $i -le 100 ];do
	let sum+=i
	let i++
done
echo sum=$sum
