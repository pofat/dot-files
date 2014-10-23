#!/bin/bash

echo "full parameter line: $@"
echo "full parameter line: $*"
echo "full parameter line: ${@}"
echo "full parameter line: ${*}"

echo "script full name: $0"
echo "script base name: `basename $0`"

echo "acceptd $# argumetns, they are:"
for arg in `seq $#`
do 
	if [ -z "${!arg}" ]
	then
		echo -e "[${arg}]:\t>null<"
	else
		echo -e "[${arg}]:\t>${!arg}<"
	fi
done

echo "accepted ${#@} arguments, they are:"
for arg in ${*} 
do
	echo $arg
done

