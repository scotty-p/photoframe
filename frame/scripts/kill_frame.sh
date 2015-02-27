#!/bin/bash

	
PID=`ps aux |grep [f]bi | awk '{print $2}'`

if [ ! -z "$PID" ]; then 
	echo Killing fbi with pid=$PID
	kill $PID
else
	echo No process fbi in the process tree
fi

