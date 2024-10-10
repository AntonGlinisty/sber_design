#! /bin/bash

fileName=""

while true; do
	freeInodes=$(df -i / | awk '{print $4}' | sed -n '2p')
	if [ "$CURRENT_DATE" != $(date +%d_%m_%Y) ]; then
		export CURRENT_DATE=$(date +%d_%m_%Y)
		fileName=${START_TIMESTAMP}_${CURRENT_DATE}.csv
		touch $fileName
		echo -e "Time,\tFree inodes count" >> $fileName
	fi
	echo -e "$(date +%T),\t$freeInodes" >> $fileName
	sleep 10
done
