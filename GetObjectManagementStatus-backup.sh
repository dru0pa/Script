#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
#backup script of the interface and port file using the GetObjectManagementStatus.pl script

# backup of the Interface file

rm -vf `ls -1t /opt/InCharge9/IP/smarts/regional/conf/discovery/backup-RIM_ForcedManagementStatus/ | head -n-7`

/opt/InCharge9/IP/smarts/global/script/GetObjectManagementStatus.pl $(hostname -s) Interface
mv /opt/InCharge9/IP/smarts/regional/conf/discovery/RIM_ForcedManagementStatus.conf /opt/InCharge9/IP/smarts/regional/conf/discovery/backup-RIM_ForcedManagementStatus/RIM_ForcedManagementStatus.conf.Interface.$(date +%Y-%m-%d).backup

#backup of the Port file

/opt/InCharge9/IP/smarts/global/script/GetObjectManagementStatus.pl $(hostname -s) Port
mv /opt/InCharge9/IP/smarts/regional/conf/discovery/RIM_ForcedManagementStatus.conf /opt/InCharge9/IP/smarts/regional/conf/discovery/backup-RIM_ForcedManagementStatus/RIM_ForcedManagementStatus.conf.Port.$(date +%Y-%m-%d).backup


#end
