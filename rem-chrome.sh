# Takes in a user, ip address and browser address and remotely opens chrome using nohup to the page pointed by the browser address
# on the machine at the ip address using the ssh protocol

rem-chrome-kill () {
	pid=$(ssh $1@$2 ps -f | grep http | awk '{print$2}')
	echo $1, $2
	echo $pid
	ssh $1@$2 DISPLAY=:0 nohup kill $pid 1>/dev/null 2>&1 &
}

rem-chrome () {
	rem-chrome-kill $1 $2
	ssh $1@$2 DISPLAY=:0 nohup google-chrome $3 1>/dev/null 2>&1 &	
}

