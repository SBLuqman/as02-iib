#!/bin/bash

# Create logs directory if it does not exist
LOGS_DIR="$(dirname "$0")/../logs"
mkdir -p "$LOGS_DIR"
LOG_FILE="$LOGS_DIR/sysinfo_$(date +%Y%m%d_%H%M%S).log"

# Define report generation block to feed into both stdout and the log file
generate_report() {
    echo "=========================================="
    echo "          SYSTEM INFORMATION REPORT       "
    echo "          Generated: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "=========================================="

    # 1. Hostname
    echo "Hostname:     $(hostname)"

    # 2. OS/Kernel
    echo "OS/Kernel:    $(uname -sr)"

    # 3. Uptime
    echo "Uptime:      $(uptime -p)"

    # 4. CPU Load
    echo "CPU Load:     $(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')"

    # 5. Memory Usage
    echo "Memory Usage:"
    free -h | awk 'NR==1{print "               " $1,$2,$3,$4} NR==2{print "  " $1 ":       " $2,$3,$4,$5}'

    # 6. Disk Usage
    echo "Disk Usage:"
    df -h / | awk 'NR==1{print "               " $1,$2,$3,$4,$5} NR==2{print "  Root Space:  " $1,$2,$3,$4,$5}'

    echo "=========================================="
}

# Run the report and mirror the output to the terminal and log file using tee
generate_report | tee "$LOG_FILE"
echo "Report written to: $LOG_FILE"
