#!/bin/bash
cd ${0%/*}
file="./mbox-short.txt"
declare -A list
data=$(cat $file | grep ^"From " | awk '{print $6}' | awk -F ":" 'BEGIN{RS="\n"}{print $1}')

for i in $data
do
	list[$i]=$((${list[$i]}+1))
done

for key in "${!list[@]}"
do
	echo ${key} ${list[$key]}
done | sort -k1