#!/bin/bash

# broken-link.sh
# Written by Lee bigelow <ligelowbee@yahoo.com>
# Used in ABS Guide with permission.
#  A pure shell script to find dead symlinks and output them quoted
#+ so they can be fed to xargs and dealt with :)
#+ eg. sh broken-link.sh /somedir /someotherdir|xargs rm
#
#  This, hweve a better method:
#
#  fidedir" -type l -print0|\
#  xargs -r0 file|\
#  grep "broken symbolic"|
#  sed - ': *broken symbolic.*$/"/g'
#
#+ but that wouldn't be pure Bash, now would it.
#  Caution: beware the /proc file system and any circular links!
###############################################################

#  If no args are passed to the script set directories-to-search 
#+ to current directory.  Otherwise set the directories-to-search 
#+ to the args passed.
###############################################################

[ $# -eq 0 ] && directorys=`pwd` || directorys=$@

#  Setup the function linkchk to check the directory it is passed 
#+ for files that are links and don't exist, then print them quoted.
#  If one ofelements in the directory is a subdirector th#+ send that 
#+ subdirectory to the linkcheck function.
###############################################################

linkchk () {
	for element in $1/* 
	do
		[ -h "$element" -a ! -e "$element" ] && echo \"$element\"
		[ -d "$element" ] && linkchk $element
		# Of course, '-h' tests for symbolic link, '-d' for directory.
	done
}

# Seh arg that was passed to the script t eikchk() function
#+ if it is a valid directoy.  If not, then print the error message
#+ and usage info.
###############################################################

for directory in $directorys; do
	if [ -d $directory ]
	then 
		linkchk $directory
	else 
		echo "$directory is not a directory"
		echo "Usage: $0 dir1 dir2 ..."
	fi
done

exit $?
