#!/bin/bash

Task1:
#loacate a folder called workspace
locate workspace | head -n 1
or
find -name "workspace" -type d

#creating variable for the directory
directoryPath = $"locate workspace | head -n 1"

#checking whether the directory exists
if [ -d "$directoryPath"]; then
 find "$directoryPath" -type f -mmin +30 -delete
 echo " Deleted files older than 30 minutes in $directoryPath"
else 
    echo "Directory $directoryPath does not exit"
fi

------------------------------------------
Task2: Run a script called startup.sh on system reboot

Step1: crontab -e
step2: enter 2 for Vim editor
Step3: @reboot /home/saran/startup.sh #add this in end of the crontab file
Step4: save and exit the vim editor
Step5: crontab -l #to check crontab jobs

---------------------------------------

Task3: remove all files under /build dir
rm -rf /build/*

-----------------------------------------

Task4: run cleanup.sh every hour every day
0 * * * * /home/saran/cleanup.sh


