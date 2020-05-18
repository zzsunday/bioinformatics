#!/bin.bash
rand=$[$RANDOM%11]

while read -p "please input a number:" n ; do
	[[ $n =~ ^[[:digit:]]$ ]] ||{ echo "please enter a num";continue;}
	if [ $rand -gt $n ];then
		echo little
	elif [ $rand -lt $n ];then
		echo more
	else
		break
	fi
done
echo right
