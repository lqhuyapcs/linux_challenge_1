#!/bin/bash
currentLoginDir='/home/huy/Documents/currentLogin.txt'
mailDir='/home/huy/Documents/mail.txt'


currentLogin=`sudo last -R -s '5 minutes ago' -t 'now' | head -n -2`
echo -e "$currentLogin" >> $currentLoginDir
for login in "$currentLogin"; do
	month="$(echo "$login" | awk '{print $4}')"
	day="$(echo "$login" | awk '{print $5}')"
	time="$(echo "$login" | awk '{print $6}')"
	timeStarted=`date -d"$month $day $time" "+%Y-%m-%d %H:%M"`
	timeNow=`date "+%Y-%m-%d %H:%M"`
	echo $timeNow
	echo $timeStarted
	between=`date -u -d @$(($(date -d "$timeNow" '+%s') - $(date -d "$timeStarted" '+%s'))) '+%M'`
	if [[ $between -lt 5 ]]
	then	
		echo -e "User" "$(echo "$login" | awk '{print $1}')" " logged in at " "$(echo "$login" | awk '{print $4,$5,$6}')"
		echo -e "User" "$(echo "$login" | awk '{print $1}')" " logged in at " "$(echo "$login" | awk '{print $4,$5,$6}')" >> $mailDir
	fi
done