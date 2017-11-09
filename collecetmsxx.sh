#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
for Hostname in `cat /root/scripts/AndrewCDMcaps`

do
rsync -avh -e ssh $Hostname:/tmp/msxx.txt /tmp/$Hostname.msxx.txt

done

cat /tmp/*.msxx.txt > /tmp/list.txt

echo -e "Hi,\\n\\n Please find the attached Doc.\\n\\nRegards,\\nConfig" | mailx -s "Todays MSXX details" -a /tmp/list.txt andrew.price@za.didata.com,Farhaad.Laher@za.didata.com

