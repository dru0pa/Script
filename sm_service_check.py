import os
import fileinput
import time
#script to check running number of running prossess and stop porsess and restart once all are stopped
# script writen Andrew Price
# 2015- 06-16

#check the service and count running
os.system ('/opt/InCharge9/SAM/smarts/bin/sm_service show >/tmp/sm_service')
a = open ('/tmp/sm_service', 'r').readlines()
print ('check number of running sm_services')
running = 0
stopped = 0
for line in a:
	if "RUNNING" in line:
		running += 1
#stop the services and loop while not =
print ('stopping sm_services')
os.system ('/opt/InCharge9/SAM/smarts/bin/sm_service stop --all')
while stopped != running:
	stopped  = 0
	os.system ('/opt/InCharge9/SAM/smarts/bin/sm_service show >/tmp/service-stop')
	b = open ('/tmp/service-stop', 'r').readlines()
	for line in b:
        	if "NOT" in line:
                	stopped += 1
##start service
time.sleep(2)
print ('starting sm_service')
os.system ('/opt/InCharge9/SAM/smarts/bin/sm_service start --all')
##
os.system ('/opt/InCharge9/SAM/smarts/bin/sm_service show')
os.system ('rm -rf /tmp/sm_service')
os.system ('rm -rf /tmp/service-stop')
