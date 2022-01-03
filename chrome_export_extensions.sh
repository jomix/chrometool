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
			#echo $content
			MANIFEST=$(find $content  -name manifest.json)
			# echo $MANIFEST
			EXT_ID=$(basename $content)
			# echo $EXT_ID
			URL=$(echo $EXT_ID | awk '{ print "https://chrome.google.com/webstore/detail/" $NF }')
			echo -n "$URL - " 
			curl -sL "$URL" | pup 'title text{}'
		done
		echo
	fi
done

# restore $IFS
IFS=$SAVEIFS
