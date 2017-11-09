#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# MEA RIM move to IS cloud

# Script is to ping clinet CI devices

rm -rf /tmp/pingclient.txt

rm -rf /tmp/ping-client-ip.txt


cat /root/scripts/move_to_cloud/all-client-ip.txt | grep $(hostname -s) | grep -o '^\S*' >> /tmp/ping-client-ip.txt


for IP in `cat /tmp/ping-client-ip.txt`
do

        echo "Pinging $IP of $(hostname -s)" >> /tmp/pingclient.txt
        ping -c 2 $IP >> /tmp/pingclient.txt

done

cat /tmp/pingclient.txt | mailx -S smtp="152.110.138.8" -s "Ping Client IP of CDM $(hostname -s)" "andrew.price@za.didata.com"

