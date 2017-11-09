#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# Script to restart all sm_ services on CDMs in group 4
#
#Change this file to change CDM
for i in `cat /opt/scripts/AndrewCDMcaps-4`
#for i in `cat /opt/scripts/CDMserver1`
do
echo "$i"
ssh $i python /root/scripts/update-script/sm_service_check.py
done
