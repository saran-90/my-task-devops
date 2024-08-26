#!/bin/bash

mkdir process-parent
echo " created a folder: $(ls | grep parent) "
cd process-parent/
echo "Creating a text file called process.txt"
echo
"Hi 
Hope you are doing good 
You must belive in the process - MS.DHONI " > process.txt
echo "content of process.txt file: $(cat process.txt)"
echo " Printing the line which has the word process from the process.txt file with its line number: $(grep -in process process.txt)"
echo "Now printing top 5 processes by memory usage in process.log file"
ps aux --sort=-%mem | head -n 6 > process.log
echo "Showing the process.log file: $(cat process.log)"

echo "==================="

cd /home/$whoami
mkdir process-jar
cd process-jar/
echo "Creating a new user called linuxuser"
sudo useradd -g linuxuser
touch file.jar
echo " change the owner of the file as the  linux user and root group"
sudo chown linuxuser:root file.jar
echo "file.jar permissions: $(ls -ltr)"
echo "Setting the execute permission for file.jar"
sudo chmod u+x file.jar
echo "Now we can execute this file: $(ls -ltr | grep file.jar)"
echo " executing the jar file"
sudo -u linuxuser java -jar file.jar
echo "Done executing the jar file"

echo "===================="
cd /home/$whoami
mkdir process-final
echo "Going back to home directory and create a new directory: $(ls | grep final)"
cd process-final
echo
"Hi I'm $whoami, logged into the machine $(hostname -I) at $date, have observations listed, 

Contents of process.log are below:
$(cat /home/$whoami/process-parent/process.log) " > userinfo.txt

echo " User info file has been created: $(cat userinfo.txt)"

echo "Now removing everything which we created"

cd /home/$whoami
ls -d */ | xargs rm -rf
sudo userdel linuxuser