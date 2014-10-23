#!/bin/bash
# try invoking like './\@and\*.sh {1..9}

echo 'first test $@'

for w in "prefix $@ posfix"
do
	echo "$w"
done
echo

echo 'then test $*'

for w in "prefix $* posfix"
do
	echo "$w"
done
