#!.bin.bash
until [ -z "$1" ];do
	echo "useradd $1,$1 is created"
	shift
done
echo "done"
