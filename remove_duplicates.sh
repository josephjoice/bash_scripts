#!/bin/bash
OIFS="$IFS"
IFS=$'\n'

declare -A mdmap
for i in $(find "$PWD" -name "*");do
	var=$(md5sum $i )
	var1=$(echo $var|cut -d ' ' -f 1 )
	var2=$(echo $var|cut  -b 35- )
	if [ ! -z "$var1" ];then
		
		mdmap[$var1]=${mdmap[$var1]}",$var2"
	fi
done
for K in "${!mdmap[@]}"; do 
	echo $K --- ${mdmap[$K]} | cut -d  "," -f 3


done

IFS="$OIFS"
