#!/bin/bash

# Time threshold in seconds (15 minutes)
THRESHOLD=600

# Log file location
LOGFILE="/Users/fireparty/zfus/idle-sleep/idle_sleep.log"

while true; do
    idle_time=$(ioreg -c IOHIDSystem | awk '/HIDIdleTime/ {print $NF / 1000000000; exit}')
    idle_sec=${idle_time%.*}

    if [ "$idle_sec" -ge "$THRESHOLD" ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Idle for $idle_sec seconds. Sleeping now..." >> "$LOGFILE"
        /usr/bin/pmset sleepnow
    fi

    sleep 60
done
