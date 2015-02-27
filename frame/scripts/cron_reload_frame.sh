#!/bin/bash

/root/frame/scripts/kill_frame.sh
/root/frame/scripts/start_frame.sh

if [ $? -eq 0 ]; then
	exit 0
else 
	exit 1
fi
