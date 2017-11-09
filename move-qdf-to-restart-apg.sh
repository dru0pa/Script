#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# This script is to move 5 file in the /opt/APG/Collecting/FailOver-Filter/Default/tmp-alerting to /var
# so that APG service can be restarted


find /opt/APG/Collecting/FailOver-Filter/Default/tmp-alerting -type f -printf "%C@ %p\n" | sort | tail -n 5 |     cut -d " " -f 2- | tr '\n' '\0' | xargs -0 mv -t /var/
df -h
service apg-services restart
echo "To move file back run move-qdf-back-apg.sh once there is about + 1GB of space"
echo "use 'watch df -h'" 
