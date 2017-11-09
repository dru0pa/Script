import os
import time
################
#Script is to run all update checks and restart services 
#
#writen by Andrew Price for MEA DD
################


#os.system ('touch /var/log/rimupdate/updatecheck$(date +%Y-%m-%d.log')

print "Starting check for gp-indwe"
os.system ('/root/scripts/update-script/RIM_CDM_Cisco.sh  2>&1 | tee /var/log/rimupdate/updatecheck-1-$(date +%Y-%m-%d).log')
time.sleep(1)
print "Statting Upgrade check."
os.system ('python /root/scripts/update-script/collectingxml.py 2>&1 | tee /var/log/rimupdate/updatecheck-2-$(date +%Y-%m-%d).log')
time.sleep(1)
print "Starting response script"
os.system ('python /root/scripts/update-script/response.py 2>&1 | tee /var/log/rimupdate/updatecheck-3-$(date +%Y-%m-%d).log')
time.sleep(1)
print "Starting rim-crontab script"
os.system ('python /root/scripts/update-script/rim-crontab.py 2>&1 | tee /var/log/rimupdate/updatecheck-4-$(date +%Y-%m-%d).log')
time.sleep(1)
print "Starting rpm checks script"
os.system ('python /root/scripts/update-script/rpm-post.py 2>&1 | tee /var/log/rimupdate/updatecheck-5-$(date +%Y-%m-%d).log')
time.sleep(1)
print "Starting cleanout installers"
os.system ('python /root/scripts/update-script/cleaninstallers.py 2>&1 | tee /var/log/rimupdate/updatecheck-6-$(date +%Y-%m-%d).log')
time.sleep(1)
print "Starting add to cron script"
os.system ('/root/scripts/update-script/addbackup-int-port-cron.sh 2>&1 | tee /var/log/rimupdate/updatecheck-7-$(date +%Y-%m-%d).log')
time.sleep(1)
print "Starting to enable update-snmp-polling"
os.system ('/root/scripts/update-script/Enable-all.sh 2>&1 | tee /var/log/rimupdate/updatecheck-8-$(date +%Y-%m-%d).log')
time.sleep(1)
# These script must be last services and sm_service
print "Starting services script"
os.system ('python /root/scripts/update-script/services.py 2>&1 | tee /var/log/rimupdate/updatecheck-9-$(date +%Y-%m-%d).log')
time.sleep(1)
print "Starting sm_service script"
os.system ('python /root/scripts/update-script/sm_service_check.py 2>&1 | tee /var/log/rimupdate/updatecheck-10-$(date +%Y-%m-%d).log')
time.sleep(1)
#
print "Startingcopling log"
os.system ('cat /var/log/rimupdate/updatecheck-*-$(date +%Y-%m-%d).log >> /var/log/rimupdate/updatecheck-$(date +%Y-%m-%d).log')
#time.sleep(1)
print "Starting Log compiling"
os.system ('rm -rf /var/log/rimupdate/updatecheck-*-$(date +%Y-%m-%d).log')
#time.sleep(1)
os.system ('cat /etc/cron.d/rim-crontab')
print "Completed Checks"


