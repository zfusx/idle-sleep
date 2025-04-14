#!/bin/bash

# Time threshold in seconds (10 minutes)
THRESHOLD=600

# Cooldown period after triggering sleep (in seconds)
COOLDOWN=300  # 5 minutes

# Log file location — update 'your_username' to your Mac username
LOGFILE="/Users/your_username/zfus/idle-sleep/idle_sleep.log"

while true; do
    idle_time=$(ioreg -c IOHIDSystem | awk '/HIDIdleTime/ {print $NF / 1000000000; exit}')
    idle_sec=${idle_time%.*}

    if [ "$idle_sec" -ge "$THRESHOLD" ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Idle for $idle_sec seconds. Sleeping now..." >> "$LOGFILE"
        /usr/bin/pmset sleepnow

        # Wait to prevent repeated logging or back-to-back sleep
        sleep "$COOLDOWN"
    else
        sleep 60
    fi
done
