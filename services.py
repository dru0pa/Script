#script to restart apg-services and vcmaster
# script writen Andrew Price
# 2015- 06-16

import os
import time


print 'Preparing to stopping and restarting apg-services'


print 'Status check apg-services'
 
os.system ('service apg-services status')

print 'Stopping of apg-services'

os.system ('service apg-services stop')
time.sleep(5) # delays for 5 seconds

print 'Starting of apg-services'

os.system ('service apg-services start')
time.sleep(5) # delays for 5 seconds

print 'Status of apg-services'

os.system ('service apg-services status')

print 'stopping and restarting vcmaster'

print 'Status vcmaster'
os.system ('service vcmaster status')
print 'Stopping of vcmaster'

os.system ('service vcmaster stop')
time.sleep(5) # delays for 5 seconds
print 'Starting of vcmaster'

os.system ('service vcmaster start')
time.sleep(5) # delays for 5 seconds
print 'Status of vcmaster'

os.system ('service vcmaster status')
