#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# Script is to get detail of interface and garteways on all CDMs

#admin email account
#ADMIN="andrew.price@za.didata.com"

#for Hostname in `cat /root/scripts/AndrewCDMcaps`
#do

#mkdir -p /tmp/$(hostname -s)

#touch /tmp/msxx.txt

echo $(hostname -s) > /tmp/msxx.txt

cat /etc/sysconfig/network-scripts/ifcfg-eth1 | grep GATEWAY >> /tmp/msxx.txt
cat /etc/sysconfig/network-scripts/ifcfg-eth1 | grep IPADDR >> /tmp/msxx.txt
cat /etc/sysconfig/network-scripts/ifcfg-eth1 | grep NETMASK >> /tmp/msxx.txt

#rsync -avh -e ssh $Hostname:/tmp/$Hostname/msxx.txt /tmp/$Hostname.msxx.txt

#ssh $Hostname rm -rf /tmp/$Hostname/msxx.txt

#done

#cat /tmp/*.msxx.txt > /tpm/list.txt

#echo -e "$EMAIL" | mailx -s "Alert: Partition(s) almost out of diskspace" "andrew.price@za.didata.com"

#echo -e "Hi,\\n\\n Please find the attached today's Error details.\\n\\nRegards,\\nConfig" | mailx -s "Todays Error details" -a /tpm/list.txt andrew.price@za.didata.com,Farhaad.Laher@za.didata.com



