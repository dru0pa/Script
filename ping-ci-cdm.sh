#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM

# Script is to ping clinet CI devices

for IP in `cat /root/scripts/move_to_cloud/ci-ip.txt`
do

        echo "Pinging $IP of $(hostname -s)" >> /tmp/ping.txt
        ping -c 2 $IP >> /tmp/ping.txt

done

cat /tmp/ping.txt | mailx -S smtp="152.110.138.8" -s "Ping GATEWAY of CDM" "andrew.price@za.didata.com"

