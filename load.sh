chmod +x sleep_if_idle.sh
launchctl unload ~/Library/LaunchAgents/com.user.idlesleep.plist
launchctl load ~/Library/LaunchAgents/com.user.idlesleep.plist