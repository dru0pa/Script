#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# add the lines from file to the rim-crontab

cat /root/scripts/update-script/addtocron.txt >> /etc/cron.d/rim-crontab
