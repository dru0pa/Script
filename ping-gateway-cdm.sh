#!/bin/bash

# Witen by
# Andrew Price
# For Dimention Data MEA RIM

# ping gateway of CDM for clients


rm -rf /tmp/gateway.txt

rm -rf /tmp/ip-olny.txt

rm -rf /tmp/ping.txt

cat /etc/sysconfig/network-scripts/ifcfg-eth1 | grep GATEWAY >> /tmp/gateway.txt

cat /tmp/gateway.txt | sed -r 's/^.{8}//' >>/tmp/ip-olny.txt

for IP in `cat /tmp/ip-olny.txt`
do

        echo "Pinging $IP of $(hostname -s)" >> /tmp/ping.txt
        ping -c 2 $IP >> /tmp/ping.txt

done

cat /tmp/ping.txt | mailx -S smtp="152.110.138.8" -s "Ping GATEWAY of CDM" "andrew.price@za.didata.com"
#cat /tmp/ping.txt | mailx -S smtp="152.110.138.8" -s "Ping GATEWAY of CDM" "Farhaad.Laher@za.didata.com"

