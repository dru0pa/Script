#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# Copy oid2type_Field.conf to CDM's
for i in `cat /opt/scripts/AndrewCDMcaps`
do
#ssh $i /opt/InCharge/SAM/smarts/bin/sm_service stop meacdm_$i_apm
#echo "waiting for services to stop"
#sleep 30s
#
echo "Backing up file on $i"
#BACKUP CURRENT
ssh $i cp /opt/InCharge9/IP/smarts/regional/conf/discovery/oid2type_Field.conf /opt/InCharge9/IP/smarts/regional/conf/discovery/oid2type_Field.conf_$(date +%Y-%m-%d-%H:%M).back
#
echo "rsync new OID file to $i"
#rsync NEW FILE
rsync -a  /opt/scripts/oid2type_Field.conf -e ssh $i:/opt/InCharge9/IP/smarts/regional/conf/discovery/oid2type_Field.conf
#
#reload
#sleep 5s
echo "reloading APM on $i"
ssh $i /opt/InCharge9/IP/smarts/bin/sm_tpmgr -s MEACDM_"$i"_APM --reloadoid
echo "done $i"
done
