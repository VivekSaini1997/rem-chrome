# Takes in a user, ip address and browser address and remotely opens chrome using nohup to the page pointed by the browser address
# on the machine at the ip address using the ssh protocol

rem-chrome {
	ssh $1@$2 DISPLAY=:0 nohup google-chrome $3 1>/dev/null 2>&1 &	
}

rem-kill-chrome {
	pid=$(ssh bobochimpus@$1 ps -f | grep http | awk '{print$2}')
	ssh $1@$2 DISPLAY=:0 nohup kill $pid 1>/dev/null 2>&1 &
}
