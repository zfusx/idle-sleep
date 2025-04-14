# MacOS Idle Sleep Utility

A lightweight, shell-based utility that automatically puts your Mac to sleep after a configurable period of keyboard and mouse inactivity. Built with native macOS tools (ioreg, pmset, launchd) — no additional dependencies required.

## Features

- Automatically monitors system inactivity.

- Sleeps your Mac after a defined idle period.

- Simple logging of sleep events.

- Automatically starts on login using launchd.

- Efficient and low resource usage.

## Repository Contents

idle-sleep/
├── sleep_if_idle.sh             # Main idle check script
├── com.user.idlesleep.plist     # LaunchAgent for automatic startup
├── load.sh                      # Script to install or reload the service
├── uninstall.sh                 # Removes the installed service
├── idle_sleep.log               # Sleep event log
├── launchd_stdout.log           # Launchd output log (stdout)
├── launchd_stderr.log           # Launchd error log (stderr)


## Installation

1. Clone or download this repository to `~/zfus/idle-sleep/`
2. Make the installation script executable and run it:

```bash
chmod +x load.sh
./load.sh
```

## Configuration

The default idle timeout is set to 600 seconds (10 minutes). To change this:

1. Open `sleep_if_idle.sh`
2. Modify the `THRESHOLD` value to your desired timeout in seconds:

```bash
THRESHOLD=600  # Change this value
```

## How It Works

- The script runs as a LaunchAgent using `launchctl`
- Uses `ioreg` to monitor system idle time
- Logs sleep events to `idle_sleep.log`
- Checks idle status every 60 seconds

## Files

- `sleep_if_idle.sh` - Main script that monitors idle time
- `com.user.idlesleep.plist` - LaunchAgent configuration
- `load.sh` - Installation script
- `uninstall.sh` - Uninstallation script
- `idle_sleep.log` - Activity log file

## Uninstalling

To remove the utility:

```bash
./uninstall.sh
```

## Logs

Sleep events are logged to `~/zfus/idle-sleep/idle_sleep.log` in the following format:
```
YYYY-MM-DD HH:MM:SS - Idle for XXX seconds. Sleeping now...
```

## Requirements

- macOS
- Terminal access
- Administrative privileges