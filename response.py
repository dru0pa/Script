import fileinput
import sys

################
#Script is to edit the file from TRUE to FALSE 
#
#writen by Andrew Price for MEA DD
################
a = open ('/opt/InCharge9/IP/smarts/global/conf/response.conf').read()
b = open ('/opt/InCharge9/IP/smarts/global/conf/response.conf', 'w')

replacements = {'TRUE' : 'FALSE'}
for i in replacements.keys():
	a = a.replace(i, replacements[i])
b.write(a)
b.close
################
