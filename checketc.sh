#!/bin/bash


dirEtc='/home/huy/Documents'
fileLog='/home/huy/Documents/checketc.log'
currentFileDir='/home/huy/Documents/currentFile.txt'
oldFileDir='/home/huy/Documents/oldFile.txt'
newFileDir='/home/huy/Documents/newFile.txt'
tempFileDir='/home/huy/Documents/tempFile.txt' # store current file without file that created within 30 mins
# get modified file
modifiedFile=`sudo find $dirEtc -mmin -30 -type f`

# get new file
newFile=`sudo find $dirEtc -cmin -30 -type f`

# get current file
sudo find $dirEtc -type f > $currentFileDir

# get new file within 30 mins
sudo find $dirEtc -cmin -30 -type f > $newFileDir


# get different between old file vs current file
sudo diff $currentFileDir $newFileDir | cut -c 3- | tail -n +2 > $tempFileDir

deletedFile=`diff $tempFileDir $oldFileDir | cur -c 3- | tail -n +2`

# now current file become old file
cp $currentFileDir $oldFileDir

#write to log
echo -e "[Log checketc - `date +%T` `date +%D`]"
echo -e "[Log checketc - `date +%T` `date +%D`]\n" >> $fileLog


echo -e "=== List of new files ==="
echo -e "=== List of new files ===\n" >> $fileLog
for file in $newFile; do
	isText=$(file -i $file | cut -d\  -f2)
		echo -e "\n\n\n" >> $fileLog
	if [ $isText == "text/plain;" ]
	then
		temp=`head -n 10 $file`
		echo -e $file
		echo -e $temp
		echo -e $file"\n">> $fileLog
		echo -e $temp"\n">> $fileLog
	else
		echo -e $file"\n">> $fileLog
		echo $file 
	fi
done

echo -e "=== List of modified files ==="
echo -e "=== List of modified files ===\n" >> $fileLog
for file in $modifiedFile; do
	echo -e $file
	echo -e $file"\n">> $fileLog
done

echo -e "=== List of deleted files ==="
echo -e "=== List of deleted files ===\n" >> $fileLog
for file in $deletedFile; do
	echo -e $file
	echo -e $file"\n" >> $fileLog
done

#sendmail root@localhost $fileLog
