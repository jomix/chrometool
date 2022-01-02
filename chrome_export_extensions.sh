#!/bin/bash

#deal with spaces in dir/filenames
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for file in $HOME/Library/Application\ Support/Google/Chrome/*
do
	NAME=$(basename $file)
	#echo file is $NAME
	if [[ "$NAME" == "Profile"* ]];
	then
		echo "Found profile ${file}"
		ls -1 "${file}/Extensions"  | awk '{ print "https://chrome.google.com/webstore/detail/" $NF }'
		echo
	fi
done

# restore $IFS
IFS=$SAVEIFS
