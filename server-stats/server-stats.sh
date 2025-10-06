#!/bin/bash

#This is a simple server stats script to monitor CPU, Memory, Disk, and Top Processes.


# Shows CPU, Memory, Disk, and Top Process Stats
# Compatible with most Linux distributions


echo " SERVER PERFORMANCE STATS"
echo "Date: $(date)"


# ---- CPU USAGE ----
echo ""
echo "CPU USAGE:"
cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d. -f1)
cpu_use=$((100 - cpu_idle))
echo "Total CPU Usage: ${cpu_use}%"

# ---- MEMORY USAGE ----
echo ""
echo " MEMORY USAGE:"
mem_info=$(free -m | awk 'NR==2{printf "Used: %s MB | Free: %s MB | Total: %s MB | Usage: %.2f%%\n", $3, $4, $2, $3*100/$2 }')
echo "$mem_info"

# ---- DISK USAGE ----
echo ""
echo "DISK USAGE (Root Partition):"
disk_info=$(df -h / | awk 'NR==2{printf "Used: %s | Free: %s | Total: %s | Usage: %s\n", $3, $4, $2, $5}')
echo "$disk_info"

# ---- TOP PROCESSES BY CPU ----
echo ""
echo " TOP 5 PROCESSES BY CPU USAGE:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6 | awk 'NR==1{printf "%-8s %-20s %-8s %-8s\n", "PID", "COMMAND", "%CPU", "%MEM"} NR>1{printf "%-8s %-20s %-8s %-8s\n", $1, $2, $3, $4}'

# ---- TOP PROCESSES BY MEMORY ----
echo ""
echo "TOP 5 PROCESSES BY MEMORY USAGE:"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6 | awk 'NR==1{printf "%-8s %-20s %-8s %-8s\n", "PID", "COMMAND", "%CPU", "%MEM"} NR>1{printf "%-8s %-20s %-8s %-8s\n", $1, $2, $3, $4}'


echo " END OF REPORT"

