#!/bin.bash


[ $# -ne 2 ] && echo "input just two number" && exit
[[ ! "$1" =~ ^[0-9]+$ ]] && echo "$1 is not digit"  && exit
[[ ! "$2" =~ ^[0-9]+$ ]] && echo "$2 is not digit"  && exit

uid1=`head -n"$1" /etc/passwd | tail -n1 | cut -d: -f3`
uid2=`head -n"$2" /etc/passwd | tail -n1 | cut -d: -f3`
echo sum=$[uid1+uid2]
