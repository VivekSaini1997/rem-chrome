# Takes in a user, ip address and browser address and remotely opens chrome using nohup to the page pointed by the browser address
# on the machine at the ip address using the ssh protocol

ip=192.168.1.2
user=bobochimpus

rem-set-user-and-ip () {
	user=$1
	ip=$2
}

rem-chrome-kill () {
	pid=$(ssh $user@$ip ps -f | grep http | awk '{print$2}')
	echo $1, $2
	echo $pid
	ssh $user@$ip DISPLAY=:0 nohup kill $pid 1>/dev/null 2>&1 &
}

rem-chrome () {
	rem-chrome-kill $user $ip
	ssh $user@$ip DISPLAY=:0 nohup google-chrome $1 1>/dev/null 2>&1 &	
}

rem-vol-adj () {
	ssh $user@$ip DISPLAY=:0 nohup amixer -D pulse sset Master $1 1>/dev/null 2>&1 &
}

rem-ps () {
	ssh $user@$ip ps -f
}

rem-do () {
	echo $1
	ssh $user@$ip DISPLAY=:0 nohup $1 1>/dev/null 2>&1 &	
}
