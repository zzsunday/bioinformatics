#!/bin/bash

read -p "please input your age: " AGE

[[ "$AGE" =~ ^[0-9]+$ ]] || { echo age is not digit;exit; }

if [ "$AGE" -lt 18 ];then
	echo "study"
elif [ "$AGE" -ge 18 -a "$AGE" -lt 60 ]; then
	echo "work"
else 
	echo "error"
fi
