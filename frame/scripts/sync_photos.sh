#!/bin/bash

ATT_DIR=/root/frame/attachments
USER_BASE=/root/frame/user-base


/usr/bin/fetchmail --ssl

cd $ATT_DIR
rename 's/JPG/jpg/' *.JPG

for photo in $ATT_DIR/*.jpg
do
	FILENAME=$photo
	NEWFILENAME=$(echo $photo | sha1sum | sed -e 's/ .*/-usersubmitted.jpg/g')
	mogrify -geometry "x1080" "$photo"
	mv -v $photo $USER_BASE/$NEWFILENAME
done

