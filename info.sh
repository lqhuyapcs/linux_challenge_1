#!/bin/bash
# display system information

echo -e "------------------------------[System information]------------------------------"
echo -e "Machine name: "`hostname`
echo -e "Distro:  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e "CPU:  "`awk -F':' '/^model name/ {print $2}'  /proc/cpuinfo | uniq`"  "`arch`
echo -e "Physical memory:  "`cat /proc/meminfo | grep "MemTotal" | awk '$3=="kB"{$2=$2/1024;$3="MB"} 1'`	
echo -e "Available disk usage:  "`df -m | grep "/dev/nvme0n1p7" | awk '{print $4," mB"}'` 
echo -e "-----------------------------------[IP Address]---------------------------------"
echo -e `hostname -I` | awk '{OFS=RS;$1=$1}1'
echo -e "-----------------------------------[User List]----------------------------------"
cat /etc/passwd | awk -F: '{print $1}' | sort
echo -e "----------------------------[Process Running as Root]---------------------------"
ps -U root u | sort	
echo -e "--------------------------------[Opening port]----------------------------------"
lsof -i -P -n | sort
echo -e "--------------------[Folder with write permission for other]--------------------"
find / -type f -perm -o=w
echo -e "------------------------------[Installed package]-------------------------------"
apt list --installed