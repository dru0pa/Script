#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# Script to check up time on servers
# 

#Change this file to change CDM
for i in `cat /opt/scripts/AndrewCDMcapsAll`
do


echo ----- >> /tmp/uptime.txt
echo ---$i--- >> /tmp/uptime.txt
echo ----- >> /tmp/uptime.txt

ssh $i uptime >> /tmp/uptime.txt

done

#email to support
cat /tmp/uptime.txt | mailx -s " Uptime on Servers" andrew.price@za.didata.com

rm -rf /tmp/uptime.txt

