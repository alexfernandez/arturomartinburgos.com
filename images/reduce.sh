#!/bin/bash
# Reduce quality for jpeg images

if [ -z "$2" ]
then
	echo "Please specify input images and output directory"
	exit 1
fi

mogrify -quality 80 -path $2 $1/*.jpg

