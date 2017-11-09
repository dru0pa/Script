import fileinput
import sys
################
#Script is to edit the crontab to # out the line listed 
#
#writen by Andrew Price for MEA DD
################
a = open ('/etc/cron.d/rim-crontab').read()
b = open ('/etc/cron.d/rim-crontab', 'w')

###
replacements = {'0 21 * * * root /opt/APG/Custom/update-snmp-polling.sh' : '#0 21 * * * root /opt/APG/Custom/update-snmp-polling.sh'}
for i in replacements.keys():
	a = a.replace(i,replacements[i])
b.write(a)
b.close()

