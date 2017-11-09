#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM

for i in `cat /opt/scripts/AndrewCDMcaps`
do

mkdir /tmp/$i

#
	echo "$i -Swap on###" >> /tmp/$i/swapon.txt
		ssh $i swapon -s >> /tmp/$i/swapon.txt


cat /tmp/$i/swapon.txt >> /tmp/swapon.txt

done

cat /tmp/swapon.txt | mailx -s " Swapon Space" andrew.price@za.didata.com
#Remove created files
rm -rf /tmp/$i
rm -rf /tmp/swapon.txt
                 
