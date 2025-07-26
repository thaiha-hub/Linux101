#!/bin/bash

#Define the threshold value for CPU usage (80%), memory usage (80%), and disk usage (80%)
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

#Function to send an alert
send_alert() {
    echo "$(tput setaf 1)ALERT: $1 usage exceeded threshold! Current value: $2%$(tput sgr0)"
}

#tput setaf 1: change the text color to red (optional)
#tput sgr0: reset text formatting   
# $1 represents the first argument passed to the function (eg. CPU, Memory, Disk)
# $2 represents the second argument passed to the function (eg. current usage percentage)

while true; do
  # Monitor CPU usage
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    cpu_usage=${cpu_usage%.*}       # Convert to integer
    echo "Current CPU usage: $cpu_usage%"

    if ((cpu_usage >= CPU_THRESHOLD)); then
    send_alert "CPU" "$cpu_usage"
    fi
  # top -bn1: run top command in batch mode, one iteration
  # grep "Cpu(s)": filter the output to get CPU usage line
  # awk '{print $2 + $4}': extract the user and system CPU usage percentages      
  # ${cpu_usage%.*}: remove decimal part to convert to integer
  # if ((cpu_usage >= CPU_THRESHOLD)): check if CPU usage exceeds threshold

  # Monitor memory usage
    memory_usage=$(free | awk '/Mem/ {printf("%3.1f", ($3/$2) * 100)}')
    echo "Current memory usage: $memory_usage%"
    memory_usage=${memory_usage%.*}
    if ((memory_usage >= MEMORY_THRESHOLD)); then
        send_alert "Memory" "$memory_usage"
    fi
# free: display memory usage
# awk '/Mem/ {printf("%3.1f", ($3/$2) * 100)}': calculate memory usage percentage
# ${memory_usage%.*}: remove decimal part to convert to integer
# if ((memory_usage >= MEMORY_THRESHOLD)): check if memory usage exceeds threshold  

  # Monitor disk usage
    disk_usage=$(df -h / | awk '/\// {print $(NF-1)}')
    disk_usage=${disk_usage%?} # Remove the % sign
    echo "Current disk usage: $disk_usage%"

    if ((disk_usage >= DISK_THRESHOLD)); then
    send_alert "Disk" "$disk_usage"
    fi
# df -h /: display disk usage for root partition
# awk '/\// {print $(NF-1)}': extract the disk usage percentage
# ${disk_usage%?}: remove the % sign to convert to integer
# if ((disk_usage >= DISK_THRESHOLD)): check if disk usage exceeds threshold

    clear
    echo "Resource Usage:"
    echo "CPU: $cpu_usage%"
    echo "Memory: $memory_usage%"
    echo "Disk: $disk_usage%"
    sleep 2
done
