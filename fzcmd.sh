#! /bin/sh

USAGE="fzcmd [directory] [pattern] [command]"

PAGER=cat

# Check pager command
if (type bat > /dev/null 2>&1) ; then
	PAGER=bat
elif (type lv > /dev/null 2>&1) ; then
	PAGER=lv
elif (type less > /dev/null 2>&1) ; then
	PAGER=less
elif (type more > /dev/null 2>&1) ; then
	PAGER=more
fi


# Default setting
DIR=.
PATTERN=.
CMD=$PAGER


# Analyze arguments
if [ $# -eq 0 ]; then
   echo Do nothing > /dev/null
elif [ $# -eq 1 ]; then
	if [ -d $1 ]; then
	   DIR=$1
	   PATTERN=.
	   CMD=$PAGER
	elif (type $1 > /dev/null 2>&1); then
	   DIR=.
	   PATTERN=.
	   CMD=$1
	else
	   DIR=.
	   PATTERN=$1
	   CMD=$PAGER
	fi
elif [ $# -eq 2 ]; then
	if [ -d $1 ] && (type $2 > /dev/null 2>&1); then
		DIR=$1 
		PATTERN=.
		CMD=$2
	elif (type $2 > /dev/null 2>&1) ; then
		DIR=.
		PATTERN=$1
		CMD=$2
	elif [ -d $1 ]; then
		DIR=$1
		PATTERN=$2
		CMD=$PAGER
	else
		echo $USAGE
	fi
elif [ $# -eq 3 ]; then
	   DIR=$1
	   PATTERN=$2
	   CMD=$3
else
	echo $usage
	exit
fi
   

# Execute fd and fzf, and select target file.
FILE=`fd --type f --type l $PATTERN $DIR | fzf --preview 'bat --color=always --style=header,grid {}'`

# Execute command to the file.
$CMD $FILE
