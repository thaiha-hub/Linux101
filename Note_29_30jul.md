## ls
ls --color=auto/always/never   display outputs in different colors 
ls /                           list files and directories under / aka the root directory of the file system

## How to find the mail path
```bash
ls -l /var/mail  
ls -l /var/spool/mail     #look for the user  
ls -la /home/user         #look for maildir
env | grep MAIL           # check the Environment variable and look for MAIL, MAILPATH, MAILDIR
```

# Bash scripting

$# Number of arguments given
$0 the script itself
$1 the first argument
$2 the second argument (if has)  
## Shebang 
The Shebang line is always at the top of a script.  
It begins with #! and is followed by the path to a specified interpreter (/bin/bash) with which the script is executed.  
* with python 	#!/usr/bin/env python
* with perl 	#!/usr/bin/env perl

Eg. CIDR.sh  
```bash
#!/bin/bash

# Check for given arguments, like for instance $ CIDR.sh argument1 argument2 then $# = 2
if [ $# -eq 0 ]
then
	echo -e "You need to specify the target domain.\n"
	echo -e "Usage:"
	echo -e "\t$0 <domain>"
	exit 1
else
	domain=$1    # the 1st arguement (if has) stores in a variable called domain
fi

# Identify Network range for the specified IP address(es)
function network_range {
	for ip in $ipaddr
	do
		netrange=$(whois $ip | grep "NetRange\|CIDR" | tee -a CIDR.txt)
		cidr=$(whois $ip | grep "CIDR" | awk '{print $2}')
		cidr_ips=$(prips $cidr)
		echo -e "\nNetRange for $ip:"
		echo -e "$netrange"
	done
}

# Ping discovered IP address(es)
function ping_host {
	hosts_up=0
	hosts_total=0
	
	echo -e "\nPinging host(s):"
	for host in $cidr_ips
	do
		stat=1
		while [ $stat -eq 1 ]
		do
			ping -c 2 $host > /dev/null 2>&1
			if [ $? -eq 0 ]
			then
				echo "$host is up."
				((stat--))
				((hosts_up++))
				((hosts_total++))
			else
				echo "$host is down."
				((stat--))
				((hosts_total++))
			fi
		done
	done
	
	echo -e "\n$hosts_up out of $hosts_total hosts are up."
}

# Identify IP address of the specified domain
hosts=$(host $domain | grep "has address" | cut -d" " -f4 | tee discovered_hosts.txt)

echo -e "Discovered IP address:\n$hosts\n"
ipaddr=$(host $domain | grep "has address" | cut -d" " -f4 | tr "\n" " ")

# Available options
echo -e "Additional options available:"
echo -e "\t1) Identify the corresponding network range of target domain."
echo -e "\t2) Ping discovered hosts."
echo -e "\t3) All checks."
echo -e "\t*) Exit.\n"

read -p "Select your option: " opt

case $opt in
	"1") network_range ;;
	"2") ping_host ;;
	"3") network_range && ping_host ;;
	"*") exit 0 ;;
esac
```
