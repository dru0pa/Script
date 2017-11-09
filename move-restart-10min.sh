#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# This script is to move 5 file in the /opt/APG/Collecting/FailOver-Filter/Default/tmp-alerting to /var
# so that APG service can be restarted and seelps for 10 minutes and moves file back

df -h
find /opt/APG/Collecting/FailOver-Filter/Default/tmp-alerting -type f -printf "%C@ %p\n" | sort | tail -n 5 |     cut -d " " -f 2- | tr '\n' '\0' | xargs -0 mv -t /var/
df -h
service apg-services restart
slep 2m
df -h
sleep 2m
df -h
sleep 2m
df -h
sleep 2m
df -h 
sleep 2m
mv /var/*.qdf /opt/APG/Collecting/FailOver-Filter/Default/tmp-alerting
