#!/bin/bash

read -p "yes or no: " ANS
if [ -z "$ANS" ] ;then
	echo please input yes or no
	exit
fi
case $ANS in
[Yy]|[Yy][Ee][Ss])
	echo your answer is yes
	;;
[Nn]|[Nn][Oo])
	echo your answer is no
	;;
*)
	echo your answer is wrong
esac
