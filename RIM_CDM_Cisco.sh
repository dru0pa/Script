#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# Move the RIM_CDM_Cisco.ncf after upgarde

#host=$(hostname -s)


if [ $(hostname -s) = "gp-indwe" ]; then
    printf '%s\n' "on the right host moving RIM_CDM_Cisco.ncf"
    mv /opt/InCharge9/SAM/smarts/global/conf/icoi/RIM_CDM_Cisco.ncf /opt/InCharge9/SAM/smarts/global/conf/icoi/unusedncf/RIM_CDM_Cisco.ncf.$(date +%Y-%m-%d).back

else
    printf '%s\n' "uh-oh, not on gp-indwe"
fi


