#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
for i in `cat /opt/scripts/AndrewCDMcaps`
do
#
#starting
echo "starting $i"
#
#create diretory

mkdir -p /opt/backup/RIM.9.2.4.6/$i
#
#BACKUP CURRENT
#rim-crontab 
rsync -a -e ssh $i:/etc/cron.d/rim-crontab /opt/backup/RIM.9.2.4.6/$i/rim-crontab_$(date +%Y-%m-%d).back
echo "done $i rim-crontab"
#
#snmp-polling-distribution.xml
rsync -a -e ssh $i:/opt/APG/Collecting/SNMP-Collector/Default/conf/snmp-polling-distribution.xml /opt/backup/RIM.9.2.4.6/$i/snmp-polling-distribution.xml_$(date +%Y-%m-%d).back
echo "done $i snmp-polling-distribution.xml"
#
#backend-socketconnector.xml
rsync -a -e ssh $i:/opt/APG/Collecting/Collector-Manager/Default/conf/backend-socketconnector.xml /opt/backup/RIM.9.2.4.6/$i/backend-socketconnector.xml_$(date +%Y-%m-%d).back
echo "done $i backend-socketconnector.xml"
#
#collecting.xml
rsync -a -e ssh $i:/opt/APG/Collecting/Collector-Manager/Default/conf/collecting.xml /opt/backup/RIM.9.2.4.6/$i/collecting.xml_$(date +%Y-%m-%d).back
echo "done $i collecting.xml"
#
#users 
rsync -a -e ssh $i:/opt/APG/Tools/Webservice-Gateway/Default/conf/users /opt/backup/RIM.9.2.4.6/$i/users_$(date +%Y-%m-%d).back
echo "done $i users "
#
#remove atrpms.sh
ssh $i rm -rf /etc/profile.d/atrpms.sh
echo "done $i remove atrpms.sh"
#
#server.xml
rsync -a -e ssh $i:/opt/InCharge9/CONSOLE/smarts/tomcat/conf/server.xml /opt/backup/RIM.9.2.4.6/$i/server.xml_$(date +%Y-%m-%d).back
echo "done $i rim-crontab"
#
#snmp-mask 
rsync -a -e ssh $i:/opt/APG/Collecting/SNMP-Collector/Default/conf/snmp-masks.xml /opt/backup/RIM.9.2.4.6/$i/snmp-masks.xml_$(date +%Y-%m-%d).back
echo "done $i snmp-mask"
#
# nslations.xml
rsync -a -e ssh $i:/opt/APG/Collecting/SNMP-Collector/Default/conf/translations.xml /opt/backup/RIM.9.2.4.6/$i/translations.xml_$(date +%Y-%m-%d).back
echo "done $i translations.xml"
#
#
#backup discovery.conf
rsync -a -e ssh $i:/opt/InCharge9/IP/smarts/conf/discovery/discovery.conf /opt/backup/RIM.9.2.4.6/$i/discovery.conf_$(date +%Y-%m-%d).back
echo "done $i discovery.conf"
#
#change user
cp /opt/backup/RIM.9.2.4.6/$i/users_$(date +%Y-%m-%d).back /opt/backup/RIM.9.2.4.6/$i/users_$(date +%Y-%m-%d).back.changeme
sed 's/changeme/gsoa4ever/' /opt/backup/RIM.9.2.4.6/$i/users_$(date +%Y-%m-%d).back
echo "done $i change password"
#
#
#backup slave-snmp-poller.xml
rsync -a -e ssh $i:/opt/APG/Collecting/SNMP-Collector/Default/conf/slave-snmp-poller.xml /opt/backup/RIM.9.2.4.6/$i/slave-snmp-poller.xml$(date +%Y-%m-%d).back
echo "done $i slave-snmp-poller.xml"
#
#
#backup tolower.rb
rsync -a -e ssh $i:/var/lib/puppet/lib/puppet/parser/functions/tolower.rb /opt/backup/RIM.9.2.4.6/$i/toupper.rb_$(date +%Y-%m-%d).back
echo "done $i toupper.rb"
#
#
# backup RIM_CDM_Notif_getInfo.asl
rsync -a -e ssh $i:/opt/InCharge9/SAM/smarts/global/rules/icoi-trapd/RIM_CDM_Notif_getInfo.asl /opt/backup/RIM.9.2.4.6/$i/RIM_CDM_Notif_getInfo.asl_$(date +%Y-%m-%d).back
echo "done $i RIM_CDM_Notif_getInfo.asl"
#
#
# backup RIM_CDM_Notif_getInfo.asl
rsync -a -e ssh $i:/etc/security/limits.conf /opt/backup/RIM.9.2.4.6/$i/limits.conf_$(date +%Y-%m-%d).back
echo "done $i limits.conf"
#
#
#enabled="false" name="XMLCollector-Juniper"
mv /opt/backup/RIM.9.2.4.6/$i/collecting.xml_$(date +%Y-%m-%d).back /opt/backup/RIM.9.2.4.6/$i/collecting.xml_$(date +%Y-%m-%d).back.old
sed 's/enabled="true" name="XMLCollector-Juniper"/enabled="false" name="XMLCollector-Juniper"/' /opt/backup/RIM.9.2.4.6/$i/collecting.xml_$(date +%Y-%m-%d).back.old > /opt/backup/RIM.9.2.4.6/$i/collecting.xml_$(date +%Y-%m-%d).back
echo "done $i change XMLCollector-Juniper to false"
echo "finished $i"
done
