#!/bin/bash
#list out the array's indices and it's corresponding values.

eval 'indices=${!'"$1[@]}"

for idx in $(eval 'echo ${!'"$1[@]}")
do
	eval 'elem="${'"$1"'['"$idx"']}"'
	printf '[%s]\t--> %s\n' "$idx" "$elem"
done
