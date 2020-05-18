#!/bin/bash

for i in {1..8};do
	for j in {1..4};do
		if [ $[i%2] -eq 0 ];then
			echo -e "\033[1;41m  \033[0m\033[1;43m  \033[0m\c"
		else
			echo -e "\033[1;43m  \033[0m\033[1;41m  \033[0m\c"
		fi
	done
	echo
done
