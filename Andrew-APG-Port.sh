#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM

# Script to check all CDM APG ports and the port in site.pp

#This file has a lised of CDMs
for i in `cat /opt/scripts/AndrewCDMsmall`
#
do
#
# conneced to CDM and finds APG port
        echo "####$i - APG Port from backend-socketconnector ####" >> /tmp/APG-port
ssh $i cat /opt/APG/Collecting/Collector-Manager/Default/conf/backend-socketconnector.xml | grep port >> /tmp/APG-port
#
# looks up APG port in site.pp
	echo "#### $i - APG Port from sitepp ####" >> /tmp/APG-port
awk '/'$i'/{nr[NR]; nr[NR+47]}; NR in nr' /etc/puppet/manifests/site.pp >> /tmp/APG-port
#
#
done
#
#email to support
cat /tmp/APG-port | mailx -s " APG Port" andrew.price@dimensiondata.com
#
#remove file and folder
rm -rf /tmp/APG-port
#

