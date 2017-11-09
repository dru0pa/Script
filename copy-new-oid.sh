#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
#Copy oid2type_Field.conf to CDM
#
#echo "Backing up file on CDM"
#BACKUP CURRENT
#mv /opt/InCharge9/IP/smarts/regional/conf/discovery/oid2type_Field.conf /opt/InCharge9/IP/smarts/regional/conf/discovery/oid2type_Field.conf_$(date +%Y-%m-%d-%H:%M).back
#
echo "rsync new OID file to CDM"
#rsync NEW FILE
rsync -avhP -e ssh 152.110.138.8:/opt/scripts/oid2type_Field.conf /opt/InCharge9/IP/smarts/regional/conf/discovery/oid2type_Field.conf
#
#reload
#sleep 5s
echo "need to reloading APM on CDM"
echo "/opt/InCharge9/IP/smarts/bin/sm_tpmgr -s MEACDM_HOSTNAME_APM --reloadoid"
