#!/bin/bash

[ $# -lt 2 ] && echo "At least two files" && exit 23
file1_lines=$(grep "^$" $1 | wc -l)
file2_lines=$(grep "^$" $2 | wc -l)
echo "total blank lines:$[$file1_lines+$file2_lines]"
