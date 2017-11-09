#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
#ping test for all servers in the move to cloud

#remove old file
rm -rf /tmp/ping.txt

#mail client
MAIL=mailx

# store all disk info here
EMAIL=""

# retrieve hostnames
#./createCDMsfile.sh

for HOSTNAME in `cat /root/scripts/pingall`
do

	echo "Pinging $HOSTNAME" >> /tmp/ping.txt
	ping -c 2 $HOSTNAME >> /tmp/ping.txt

done

cat /tmp/ping.txt | mailx -S smtp="152.110.138.8" -s "Ping test of all devices" "andrew.price@za.didata.com"

