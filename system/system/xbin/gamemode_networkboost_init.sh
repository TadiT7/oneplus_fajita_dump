#!/system/bin/sh
tc qdisc del dev wlan0 root
tc qdisc add dev wlan0 root handle 1: htb
tc class add dev wlan0 parent 1: classid 1:4 htb rate 29kbit
tc filter add dev wlan0 protocol ip parent 1:0 prio 1 handle 1: cgroup
