import os

# This script is written by Andrew Price for MEA GSOA support
# This script is to clean up as much as posble on a cdm


os.system ('df -h')
#This is cleaning up directories
print 'Cleaning up archives'
print 'Cleaning SAM archive'
os.system ('rm -rf /opt/InCharge9/SAM/smarts/regional/logs/archives/*.gz')
print 'Cleaning SHM-Debug SAM'
os.system ('rm -rf /opt/InCharge9/SAM/smarts/regional/logs/SHM-Debug/*.*')
print 'Cleaning IP archive'
os.system ('rm -rf /opt/InCharge9/IP/smarts/regional/logs/archives/*.gz')
print 'Cleaning SHM-Debug IP'
os.system ('rm -rf /opt/InCharge9/IP/smarts/regional/logs/SHM-Debug/*.*')
print 'Cleaning Console archive'
os.system ('rm -rf /opt/InCharge9/CONSOLE/smarts/regional/logs/archives/*.gz')
print 'Cleaning Tomcat Temp'
os.system ('rm -rf /opt/InCharge9/CONSOLE/smarts/tomcat/temp/*.*')
print 'Cleaning var cores'
os.system ('rm -rf /var/cores/*.*')
print 'Cleaning up smarts-ncm log'
os.system ('find /opt/smarts-ncm/logs/*.[4-9].log -exec rm {} \;')
print 'Clening up synapse-2.0.0'
os.system ('find /opt/synapse-2.0.0/*.log.[4-9] -exec rm {} \;')
print 'Cleaning up CONSOLE smarts global logs'
os.system ('find /opt/InCharge9/CONSOLE/smarts/global/logs/*.log.[3-4] -exec rm {} \;')
#This is the end of the clean now just checking
print 'cleanup complete of archives'
os.system ('df -h')
os.system ('du -a /opt/InCharge9/SAM | sort -n -r | head -n 10')
os.system ('du -a /opt/InCharge9/IP | sort -n -r | head -n 10')
os.system ('du -a /opt/InCharge9/CONSOLE | sort -n -r | head -n 10')

