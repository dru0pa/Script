#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# Script to copy the update script file to cdms

#Change this file to change CDM
for i in `cat /opt/scripts/AndrewCDMcaps`
do

ssh $i mkdir -p /root/scripts/update-script
ssh $i mkdir -p /root/scripts/APG-Disk
ssh $i mkdir -p /root/scripts/pre-update
ssh $i mkdir -p /root/scripts/diskcleanupcdm
ssh $i mkdir -p /root/scripts/move_to_cloud
#ssh $i mkdir -p /root/scripts/decom



rsync -avhP /root/scripts/update-script/ -e ssh $i:/root/scripts/update-script/

rsync -avhP /root/scripts/APG-Disk/ -e ssh $i:/root/scripts/APG-Disk/

rsync -avhP /root/scripts/pre-update/ -e ssh $i:/root/scripts/pre-update/

rsync -avhP /root/scripts/diskcleanupcdm/ -e ssh $i:/root/scripts/diskcleanupcdm/

rsync -avhP --exclude '/root/scripts/move_to_cloud/ping-test-config.sh' /root/scripts/move_to_cloud/  -e ssh $i:/root/scripts/move_to_cloud/

rsync -avhP /root/scripts/pingall -e ssh $i:/root/scripts/pingall
#rsync -avhP /root/scripts/decom/ -e ssh $i:/root/scripts/decom/

done
