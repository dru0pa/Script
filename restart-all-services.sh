#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# Script to restart all services on CDMs
#
#Change this file to change CDM
for i in `cat /opt/scripts/AndrewCDMcaps`
#for i in `cat /opt/scripts/CDMserver1`
do
echo "$i"
ssh $i python /root/scripts/update-script/services.py
done
