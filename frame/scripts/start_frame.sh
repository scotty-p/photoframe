#!/bin/bash

QFILE=/root/frame/queue.txt
SLIDE_BASE=/root/frame/slide-base
USER_BASE=/root/frame/user-base

## Build queue
# For every 10 photos in slide-base, add a photo from user-base

if [ ! -f $QFILE ];
then
	touch $QFILE;
else 
	> $QFILE;
fi

for photo in $SLIDE_BASE/*.jpg
do
	echo "$SLIDE_BASE/`basename $photo`" >> $QFILE
done

#Randomise the queue order

sort -R $QFILE > $QFILE.tmp
mv $QFILE.tmp $QFILE

STEP=1
for photo in $USER_BASE/*.jpg
do
	RAND=`echo $(( $RANDOM % 10 + $STEP ))`
	sed -i "${RAND} i ${USER_BASE}/`basename $photo`" $QFILE
	STEP=$(expr $STEP + 10)
done


## Run fbi on virtual console 1
/usr/bin/fbi --autodown --readahead --noverbose -t 4 -T 1 --blend 1500 -l $QFILE

