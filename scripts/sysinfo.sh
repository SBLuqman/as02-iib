#!/bin/bash

echo "=========================================="
echo "          SYSTEM INFORMATION REPORT       "
echo "=========================================="

# 1. Hostname
echo "Hostname:     $(hostname)"

# 2. OS/Kernel
echo "OS/Kernel:    $(uname -sr)"

# 3. Memory Usage
echo "Memory Usage:"
free -h | awk 'NR==1{print "               " $1,$2,$3,$4} NR==2{print "  " $1 ":       " $2,$3,$4,$5}'

# 4. Disk Usage
echo "Disk Usage:"
df -h / | awk 'NR==1{print "               " $1,$2,$3,$4,$5} NR==2{print "  Root Space:  " $1,$2,$3,$4,$5}'

echo "=========================================="

