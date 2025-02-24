#! /bin/sh

USAGE="fzbat.sh [directory] [pattern]"

# Default setting
DIR=.
PATTERN=.

# Analyze arguments
if [ $# -eq 0 ]; then
   echo Do nothing > /dev/null
elif [ $# -eq 1 ]; then
	if [ -d $1 ]; then
	   DIR=$1
	   PATTERN=.
	else
	   DIR=.
	   PATTERN=$1
	fi
elif [ $# -eq 2 ]; then
	if [ -d $1 ]; then
		DIR=$1 
		PATTERN=.
	else
		echo $USAGE
		exit
	fi
else
	echo $USAGE
	exit
fi


# Execute fzcmd.sh using bat
fzcmd.sh $* bat
