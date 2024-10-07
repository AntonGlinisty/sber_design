echo ""
while true; do
	freeInodes=$(df -i / | awk '{print $4}' | sed -n '2p')
	echo "Free inodes count = $freeInodes"
	sleep 10
done
