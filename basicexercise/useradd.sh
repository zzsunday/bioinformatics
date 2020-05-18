#!/bin/bash

if [ $# -lt 1 ];then
	echo "at least one username"
	exit 2
fi
if grep "^$1>b" /etc/passwd &> /dev/null;then
	echo "user $1 exists"
else
	echo "you need to add $1"
fi
