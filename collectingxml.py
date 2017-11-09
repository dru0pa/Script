import fileinput
import sys
import os
import time
################
#Script is to edit the collecting.xml file to replace line
#
#writen by Andrew Price for MEA DD
################
print ('Reading file to replase true with false for XMLCollector-Juniper')
time.sleep(1) # delays for 1 seconds

os.system ('cat /opt/APG/Collecting/Collector-Manager/Default/conf/collecting.xml | grep XMLCollector-Juniper')

a = open ('/opt/APG/Collecting/Collector-Manager/Default/conf/collecting.xml').read()
b = open ('/opt/APG/Collecting/Collector-Manager/Default/conf/collecting.xml', 'w')

###

replacements = {'                <collector enabled="true" name="XMLCollector-Juniper" next="PropertyTaggingFilter" config="XML-Collector/Default/conf/xmlcollector-juniper-system.xml" />' : '                <collector enabled="false" name="XMLCollector-Juniper" next="PropertyTaggingFilter" config="XML-Collector/Default/conf/xmlcollector-juniper-system.xml" />'}
for i in replacements.keys():
	a = a.replace(i,replacements[i])
b.write(a)
b.close()

os.system ('cat /opt/APG/Collecting/Collector-Manager/Default/conf/collecting.xml | grep XMLCollector-Juniper')


print ('Chage complete')
