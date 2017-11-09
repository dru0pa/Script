#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# Script to check all services on CDM

#Change this file to change CDM
for i in `cat /opt/scripts/CDMserver1`
do
# Create folder
mkdir /tmp/$i

#show date
        echo "$i - Date ################# " >> /tmp/$i/date.txt
                ssh $i date >> /tmp/$i/date.txt
#Smarts Check
	echo "$i - Smarts Process ################# " >> /tmp/$i/Smarts.txt
		ssh $i /opt/InCharge9/SAM/smarts/bin/sm_service show >> /tmp/$i/Smarts.txt
#service vcmaster status
        echo "$i - vcmaster ################# " >> /tmp/$i/vcmaster.txt
                ssh $i service vcmaster status >> /tmp/$i/vcmaster.txt
#service voyence status
        echo "$i - voyence ################# " >> /tmp/$i/voyence.txt
                ssh $i service voyence status >> /tmp/$i/voyence.txt
#Check APG
	echo "$i - APG Proses ################# " >> /tmp/$i/APG.txt
		ssh $i /etc/init.d/apg-services status >> /tmp/$i/APG.txt
#Check Disk in /opt/InCharge/CONSOLE
        echo "$i - du -a /opt/InCharge/CONSOLE Space ################# " >> /tmp/$i/CONSOLE.txt
		ssh $i du -a /opt/InCharge9/CONSOLE | sort -n -r | head -n 10 >> /tmp/$i/CONSOLE.txt
#Check Disk in /opt/InCharge/SAM
	echo "$i - du -a /opt/InCharge/SAM Space ################# " >> /tmp/$i/SAM.txt
		ssh $i du -a /opt/InCharge9/SAM | sort -n -r | head -n 10 >> /tmp/$i/SAM.txt
#Check Disk in /opt/InCharge/IP
	echo "$i -  du -a /opt/InCharge/IP Space ################# " >> /tmp/$i/IP.txt
		ssh $i du -a /opt/InCharge9/IP | sort -n -r | head -n 10 >> /tmp/$i/IP.txt
#Check Disk in /opt/InCharge/VoIP
#	echo "$i - du -a /opt/InCharge/VoIP Space ################# " >> /tmp/$i/VoIP.txt
#		ssh $i du -a /opt/InCharge9/VoIP | sort -n -r | head -n 10 >> /tmp/$i/VoIP.txt
#Check Disk
	echo "$i - DF Space ################# " >> /tmp/$i/df.txt
		ssh $i df -h >> /tmp/$i/df.txt
#Check TOP
        echo "$i - TOP ################# " >> /tmp/$i/top.txt
                ssh $i top -b -n1 >> /tmp/$i/top1.txt
#
head -n 20 /tmp/$i/top1.txt  >> /tmp/$i/top.txt
#
rm -rf /tmp/$i/top1.txt
#
done
#####
#create file to mail

cat /tmp/$i/date.txt /tmp/$i/Smarts.txt /tmp/$i/vcmaster.txt /tmp/$i/voyence.txt /tmp/$i/APG.txt /tmp/$i/CONSOLE.txt /tmp/$i/SAM.txt /tmp/$i/IP.txt /tmp/$i/df.txt /tmp/$i/top.txt >> /tmp/$i/mail.txt

#email to support
cat /tmp/$i/mail.txt | mailx -s " $i Check" andrew.price@za.didata.com
#Remove created files
rm -rf /tmp/$i
