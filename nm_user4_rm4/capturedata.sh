#!/bin/sh

mcp -c 36/80 -C 1 -N 1
ifconfig wlan0 up
nexutil -Iwlan0 -s500 -b -l34 -vKuABEQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==
iw dev wlan0 interface add mon0 type monitor
ip link set mon0 up

for i in {0..31};do;tcpdump -i wlan0 dst port 5500 -vv -w nm_user3_rm2_$i.pcap -c 500;echo "done $i round";done;