import os


os.system ('rpm -qa | grep rim > /root/scripts/update-script/rimrpms-post')

os.system ('diff -y /root/scripts/update-script/rimrpms-pre /root/scripts/update-script/rimrpms-post')

os.system ('rm -rf /root/scripts/update-script/rimrpms-pre')
os.system ('rm -rf /root/scripts/update-script/rimrpms-post')
