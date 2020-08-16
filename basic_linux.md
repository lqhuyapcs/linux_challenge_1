# BASIC COMMAND
## View OS information
### Name, version, architect

```bash
$ cat /etc/os-release
```

### List package

```bash
$ apt list --installed
```

## View hardware information
### CPU
```
$ lscpu
```

### RAM
```
$ dmidecode -t 17
```

### Hard disk
```
$ lshw -class disk -class storage
```
## View network information
### Address
```
$ ifconfig
```

### View opening ports and corresponding processes
```
$ lsof -i -P
```

## Manage process
### View list of running processes 
```
$ ps -aux
```

### Kill process by PID
```
$ kill pid
``` 
If the process can not be killed, try forceful killing:
```
$ kill -KILL pid
```
<span style="color: #FFFF00">pid</span> is process id

### Kill process by name
```
$ pkill processName
```
<span style="color: #FFFF00">processName</span> is name of process

## Find file
### Find by name
#### Case sensitive
```
$ find / -name name
```

#### Case insensitive
```
$ find / -iname name
```
<span style="color: #FFFF00">name</span> is name of file

### Find by group/owner
#### by Group
```
$ find / -group groupName
```
<span style="color: #FFFF00">groupName</span> is name of group

#### by Owner
```
$ find / -user userName
```
<span style="color: #FFFF00">userName</span> is name of owner

### Find by time
#### by modify time
Use <span style="color: #FFFF00">-mtime</span> option to return  list of file was modified N*24 hours ago

find files modified more than 60 days ago
```
$ find / -mtime +60
```
find files modified less than 60 days 
```
$ find / -mtime -60
```
find files modified exactly 60 days ago
```
$ find / -mtime 60
```
#### by access time
Similar to modify time but use <span style="color: #FFFF00">-atime</span> option

### Find by size
find files bigger than 4 GiB
```
$ find / -size +4G
```

find files smaller than 4 GiB
```
$ find / -size -4G
```

find files equal to 4 GiB
```
$ find / -size 4G
```

We can use size switch for other formats:
* 'c': bytes
* 'w': two-byte words
* 'k': Kilobytes
* 'M': Megabytes
* 'G': Gigabytes

### Find by content
```
$ find / ""
```
put content in double quotes

## Set schedule
### Run command X in 0h00 everyday
```
$ 0 0 * * * user X
```

### Run command Y in 8h00 from Monday to Friday every week
```
$ 0 8 * * 1-5 user Y
```

### Run command Z every 3 hours in 15th every month
```
$ 0 */3 15 * * user Z
```

## Change mode
### Create 3 users A, B in group X, user C in group Y
```
$ useradd -g X A
$ useradd -g X B
$ useradd -g Y C
```
### Change mode file F1 to be executed by user A group X
```
$ chown A:X F1
$ chmod o=x F1
```

### Change mode folder D1 allow all users read file but only user A group X can create new file
```
$ chown A:X D1
$ chmod u=r,o=wr D1
```

### Change mode folder D2 allow only user A group A read file
```
$ chown A:A D2
$ chmod o=r D2
```

# PRACTICAL
## Get OS information
