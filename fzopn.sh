#! /bin/sh

USAGE="fzopn.sh [directory] [pattern]"

# Default setting
DIR=.
PATTERN=.

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

# Execute fzcmd.sh using open_file_with.sh
fzcmd.sh $* open_file_with.sh
