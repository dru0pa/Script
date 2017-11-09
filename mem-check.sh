#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# srtip is to check memory usare on curent CDM

#VMstat
vmstat 1 10 -tan >> /tmp/vmstat.txt

#top
top -b -n1 >> /tmp/top1.txt



#create file to mail
cat /tmp/vmstat.txt /tmp/top1.txt > /tmp/mail.txt

#email to support
cat /tmp/mail.txt | mailx -v -S smtp="152.110.138.8" -s " $i Check" andrew.price@za.didata.com
#Remove created files
rm -rf /tmp/vmstat.txt
rm -rf /tmp/top1.txt
rm -rf /tmp/mail.txt



