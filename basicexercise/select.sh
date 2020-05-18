#!/bin/bash
PS3="plsease choose;"#考虑下ps1，ps2（提示符）
select x in a b c;do
	case $x in
	a)
		echo $REPLY:your choose is a
		break
		;;
	b)
		echo $REPLY:your choose is b
		break
		;;
	c)
		echo $REPLY:your choose is c
		break
		;;
	*)
		echo no choose
		;;
	esac
done

