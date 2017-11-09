#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# Script to restart all sm_ services on meacalsam01
#
#Change this file to change CDM
for i in `cat /opt/scripts/cdm-meacalsam01-list`
#for i in `cat /opt/scripts/CDMserver1`
do
echo "$i"
ssh $i python /root/scripts/update-script/sm_service_check.py
done

