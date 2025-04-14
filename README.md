# 💤 MacOS Idle Sleep Utility

A lightweight, shell-based utility that automatically puts your Mac to sleep after a configurable period of keyboard and mouse inactivity. It uses native macOS tools (`ioreg`, `pmset`, and `launchd`) — no additional dependencies or background daemons required.

---

## 💡 Why This Tool?

While macOS has built-in sleep settings, many applications (like Chrome, App Store, Terminal, and media apps) can silently override system sleep by calling internal APIs — often without user notification. This leads to Macs staying awake indefinitely, even when idle, which causes:

- Unnecessary power consumption and energy waste  
- Increased heat and fan noise  
- Reduced hardware lifespan  
- Higher environmental impact (e-waste and emissions)

so it's Mac not go to sleep or turn off the display when move or keep not moved for some time, it keeps awake for a whole night.

`idle-sleep` restores user control by enforcing sleep when real input inactivity is detected, bypassing hidden app overrides. It’s perfect for desktops or laptops left idle overnight, or in energy-conscious setups.

---

## ✅ Features

- Automatically monitors system inactivity
- Sleeps your Mac after a defined idle period
- Simple logging of sleep events
- Automatically starts on login using `launchd`
- Efficient and low resource usage

---

## 📂 Repository Contents

```
idle-sleep/
├── sleep_if_idle.sh             # Main idle check script
├── com.user.idlesleep.plist     # LaunchAgent for automatic startup
├── load.sh                      # Script to install or reload the service
├── uninstall.sh                 # Removes the installed service
├── idle_sleep.log               # Sleep event log
├── launchd_stdout.log           # Launchd output log (stdout)
├── launchd_stderr.log           # Launchd error log (stderr)
```

---

## 🚀 Installation

1. **Clone this repository:**

```bash
git clone https://github.com/zfusx/idle-sleep.git
cd idle-sleep
```

2. **Check your current directory path:**

```bash
pwd
```

Note this path — you’ll need it in the next step.

3. **Configure paths in the files:**

- Open `sleep_if_idle.sh` and `com.user.idlesleep.plist`
- Replace `your_username` with your macOS username (check with `whoami`)
- Update all paths to match your cloned directory path

4. **Copy the LaunchAgent file:**

```bash
mkdir -p ~/Library/LaunchAgents
cp com.user.idlesleep.plist ~/Library/LaunchAgents/
```

5. **Make the scripts executable and run the installer:**

```bash
chmod +x load.sh sleep_if_idle.sh uninstall.sh
./load.sh
```

---

## ⚙️ Configuration

The default idle timeout is set to 600 seconds (10 minutes).

To change it:

1. Open `sleep_if_idle.sh`
2. Modify the `THRESHOLD` value:

```bash
THRESHOLD=600  # Set your preferred value in seconds
```

Then rerun:

```bash
./load.sh
```

---

## 🧠 How It Works

- Runs as a LaunchAgent in the background
- Uses `ioreg` to monitor system idle time
- Logs sleep events to `idle_sleep.log`
- Checks every 60 seconds
- Calls `/usr/bin/pmset sleepnow` when threshold is passed

---

## 📝 Logs

Sleep events are logged to:

```
~/zfus/idle-sleep/idle_sleep.log
```

Log format:

```
YYYY-MM-DD HH:MM:SS - Idle for XXX seconds. Sleeping now...
```

---

## 🗑️ Uninstall

Run:

```bash
./uninstall.sh
```

Or manually:

```bash
launchctl unload ~/Library/LaunchAgents/com.user.idlesleep.plist
rm ~/Library/LaunchAgents/com.user.idlesleep.plist
rm -rf ~/idle-sleep
```

---

## 📋 Requirements

- macOS
- Terminal access
- Standard user permissions (no sudo required for sleep)

---

## 📄 License

MIT License. Feel free to use, modify, and share.

---

## 🙌 Credits

Developed by ZFUS inc  
Inspired by energy-saving and hardware longevity concerns 🌱💻

