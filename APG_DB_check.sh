#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# This script is to check the error log file and email this to Admin as attachment.
# The file should be run shortly after midnight.

# Setting file imput log file
FILE1=/opt/APG/Databases/MySQL/Default/logs/mysqld.error.log

# Removing old files
rm -rf /tmp/mysqlerr.log
rm -rf /tmp/mysqlerrclean.log
rm -rf /tmp/mysqlyesterdays.log


# getting the date for yetserday
dt=`date --date='1 days ago' +%y%m%d`
err=`grep -A 10000 $dt $FILE1 | grep "ERROR" | tail -n1`

if [[ "$err" == *"ERROR"* ]]
then

# Setting output file from log file check
errfile=/tmp/mysqlerr.log

# Cleaned file
cleanerrfile=/tmp/mysqlerrclean.log

#
finalfile=/tmp/mysqlyesterdays.log

# Looking through file and out put to output file
grep -A 10000 $dt $FILE1 > $errfile

# remove duplicate lines
sort $errfile | uniq -u > $cleanerrfile

#remove all data not starting with the date set as yesterday
egrep $dt\|^-th\|^-to $cleanerrfile > $finalfile 
#sed -i '/^\(report\|-t\(h\|o\)\)/!d' your_file


# Emial results if found
echo -e "Good Morning,\\n\\nPlease find the attached Error's from yestrday's Watch4Net Error log file.\\n\\nThe check took place at 3 AM in the morning.\\n\\nThis is an automatically generated email from meacalapgdb01 server." | mailx -S smtp="152.110.138.8" -s "Yesterday has an Error from the Error log file for MySQL" -a $finalfile andrew.price@za.didata.com,PaulJ.Taylor@za.didata.com,Theuns.VanDyk@za.didata.com,Elvis.Maunye@za.didata.com,Arnold.Jeffrey@za.didata.com,Chris.Hodge@za.didata.com


else
# Email if no results are found
echo -e "Good Morning,\\n\\nPlease note that there is NO Error in yesterday's Watch4Net Error log file.\\n\\nThe check took place at 3 AM in the morning.\\n\\nThis is an automatically generated email from meacalapgdb01 server." | mailx -S smtp="152.110.138.8" -s "No Errors in the Error log file for MySQL"  andrew.price@za.didata.com,PaulJ.Taylor@za.didata.com,Theuns.VanDyk@za.didata.com,Elvis.Maunye@za.didata.com,Arnold.Jeffrey@za.didata.com,Chris.Hodge@za.didata.com
fi
