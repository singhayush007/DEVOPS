#!/bin/bash
date
echo "Uptime"
uptime
echo "Currently connected"
w
echo "-------------------"
echo "Last Logins:"
last -a | head -3
echo "-------------------"

echo "Disk and Memory Usage"
df -h / | awk 'NR==2 {print "Free/total disk: " $4 " / " $2}'
free -m | awk 'NR==2 {print " Available/total memory: " $7" / " $2 " MB"}'
echo "--------------------"
echo "Utilization and most expensive processes:"
top -b -n 1 | head -3
echo
top -b -n 1 -o %MEM | head -12 | tail -6
