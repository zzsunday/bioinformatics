#!/bin.bash
while read line;do
	user=`echo $line |cut -d: -f1`
	uid=`echo $line |cut -d: -f3`
	[ $[uid%2] -eq 0 ] && echo "$user:$uid"
done < /etc/passwd
