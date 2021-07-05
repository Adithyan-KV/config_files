#! /bin/bash

# Ensure there is an argumment
if [ $# -eq 0 ]; then
    echo "Atleast one positional argument required"
    exit 1
fi

# Check if a window of the relevant program is already open
windows_list=$(wmctrl -l|grep -i $1)
echo $windows_list
if [[ -z $windows_list ]];then
	# If program is not open, open an instance in the background
	$($1)&
fi
# bring the relevant window to focus
wmctrl -a $1