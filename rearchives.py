import os

# This script is written by Andrew Price for MEA GSOA support
# This script is to clean up the achives on a cdm

os.system ('df -h')
print 'Cleaning up archives'
os.system ('rm -rf /opt/InCharge9/SAM/smarts/regional/logs/archives/*.gz')
os.system ('rm -rf /opt/InCharge9/IP/smarts/regional/logs/archives/*.gz')
os.system ('rm -rf /opt/InCharge9/CONSOLE/smarts/regional/logs/archives/*.gz')
print 'Cleanup complete of archives'
os.system ('df -h')
os.system ('du -a /opt/InCharge9/SAM | sort -n -r | head -n 10')
os.system ('du -a /opt/InCharge9/IP | sort -n -r | head -n 10')
os.system ('du -a /opt/InCharge9/CONSOLE | sort -n -r | head -n 10')
os.system ('du -a /opt | sort -n -r | head -n 10')
print 'Checking log folders'
os.system ('ls -lsh /opt/InCharge9/IP/smarts/regional/logs')
os.system ('ls -lsh /opt/InCharge9/SAM/smarts/regional/logs')
os.system ('ls -lsh /opt/InCharge9/CONSOLE/smarts/regional/logs')
print 'Checking TMP Alerting Folder'
os.system ('ls -lsh /opt/APG/Collecting/FailOver-Filter/Default/tmp-alerting')


