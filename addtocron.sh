#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# script to add backup script of the interface and port file using the GetObjectManagementStatus.pl script to the /etc/cron.d/rim-crontab


echo "# To export the Interface and Port file weekly"
echo "0 8 * * 1 root /root/scripts/update-script/GetObjectManagementStatus-backup.sh >> /etc/cron.d/rim-crontab"

