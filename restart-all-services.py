import os

################
#Script is to restart all services on a cdm 
#
#writen by Andrew Price for MEA DD
################


os.system ('python /root/scripts/update-script/services.py 2>&1 | tee /var/log/rimupdate/updatecheck-1-$(date +%Y-%m-%d).log')
os.system ('python /root/scripts/update-script/sm_service_check.py 2>&1 | tee /var/log/rimupdate/updatecheck-2-$(date +%Y-%m-%d).log')
os.system ('cat /var/log/rimupdate/updatecheck-*-$(date +%Y-%m-%d).log >> /var/log/rimupdate/updatecheck-$(date +%Y-%m-%d).log')
os.system ('rm -rf /var/log/rimupdate/updatecheck-*-$(date +%Y-%m-%d).log')

