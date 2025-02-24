#! /bin/sh

echo Input command.

# Read command from stdin.
while true
do
	read -p ">>> " CMD
	if (type $CMD > /dev/null 2>&1); then
		break
	else
		echo $CMD is not found.
		echo Input command again.
	fi
done

# Execute command to the arguments
$CMD $*
