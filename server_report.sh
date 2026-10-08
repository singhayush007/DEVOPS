#!/bin/bash

echo "Welcome, $USER!"
echo "Date: $(date +%d-%m-%Y)"
echo "Time: $(date +%H:%M:%S)"

echo "---------------------"
echo "Server uptime: $(uptime -p)"
echo "---------------------"
echo "Last logins:"
last -a | head -5


echo "---------------------"
echo "Disk usage:"
df -h / | awk 'NR==2 {print "Used " $3 " of " $2 " (" $5 ")"}'
echo "---------------------"
echo "RAM usage:"
free -h | awk '/Mem:/ {print "Used " $3 " of " $2 ", Available " $7}'


echo "---------------------"
echo "Top 5 CPU processes:"
top -b -n 1 -o %CPU | head -12 | tail -6

