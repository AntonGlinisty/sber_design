while true; do
	freeInodes=$(df -i / | awk '{print $4}' | sed -n '2p')
	if [ "$CURRENT_DATE" != $(date +%d_%m_%Y) ]; then
		export CURRENT_DATE=$(date +%d_%m_%Y)
		touch ${START_TIMESTAMP}_${CURRENT_DATE}.csv
	fi
	echo "$(date +%T): Free inodes count = $freeInodes" >> ${START_TIMESTAMP}_${CURRENT_DATE}.csv
	sleep 10
done
