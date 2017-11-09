#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# Move the RIM_CDM_Cisco.ncf after upgarde

#host=$(hostname -s)


if [ $(hostname -s) = "wc-engenpetrol" ]; then
    printf '%s\n' "on the right CDM enabling update-snmp-polling.sh"
    python  /root/scripts/update-script/Enable-update-snmp-polling.py

else
    printf '%s\n' "uh-oh, not on wc-engenpetrol"
fi

