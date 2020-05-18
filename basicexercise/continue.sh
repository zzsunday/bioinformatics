#!/bin/bash
for i in {1..3};do
	for j in {1..10};do
		if [ $j -eq 5 ];then continue 2;fi
		echo j=$j
	done
	echo
done
