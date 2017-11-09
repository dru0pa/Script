#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# srtip is to copy snmpd.conf file to CDM

echo "Copy snmpd to CDM as snpmpd.conf.back"

rsync -avhP -e ssh cdmconfig01:/root/scripts/update-script/snmpd.conf /etc/snmp/snmpd.conf.back

echo "Backup origernal snmpd.conf"

mv /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.$(date +%Y-%m-%d).old

echo "Copy snmpd.conf.back to snmpd.conf"

cp /etc/snmp/snmpd.conf.back /etc/snmp/snmpd.conf

echo "Starting snmpd service"

/etc/init.d/snmpd start

echo "Setting snmpd to start at boot"

chkconfig snmpd on


echo "Completed snmpd setup"

