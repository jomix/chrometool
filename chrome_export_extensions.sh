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
		for content in ${file}/Extensions/*
		do
			echo $content
			find $content  -name manifest.json -print0 | xargs -0  grep 'name\":'
		done
		echo
	fi
done

# restore $IFS
IFS=$SAVEIFS
