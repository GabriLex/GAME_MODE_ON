# 🎮 Gaming Mode ON

## Overview
**Gaming Mode ON** is a Windows batch script that automatically launches your essential gaming applications — **Steam**, **Discord**, **MSI Afterburner**, and **RivaTuner Statistics Server (RTSS)** — with administrative privileges, ensuring all your gaming tools start quickly and seamlessly.

The script also generates a **timestamped log file** for each run, so you can monitor launch activity and verify successful execution.

---

## 🚀 Features

- ✅ **Automatic Admin Elevation** — Requests administrative privileges if not already elevated.  
- 🧾 **Detailed Logging** — Logs every action and error to a unique file in your `%temp%` directory.  
- 🖼️ **ASCII Art Header** — Displays a fun startup banner on launch.  
- ⚙️ **Sequential Launching** — Starts Steam, Discord, MSI Afterburner, and RTSS with short delays for reliability.  

---

## 📁 Default Launch Paths

| Application | Default Path |
|--------------|---------------|
| **Steam** | `C:\Program Files (x86)\Steam\steam.exe` |
| **Discord** | `%LocalAppData%\Discord\Update.exe` |
| **MSI Afterburner** | `C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe` |
| **RivaTuner Statistics Server (RTSS)** | `C:\Program Files (x86)\RivaTuner Statistics Server\RTSS.exe` |

> ⚠️ **Note:** If any program is installed in a different directory, update its path in the script.

---

## 🧩 How to Use

1. **Download or copy the script** to a folder (e.g., `C:\Scripts\GamingModeON.bat`).
2. **Right-click** the script and select **“Run as administrator.”**
3. Wait for the ASCII art and confirmation messages to appear.
4. Press any key when prompted to close the script after launch.

Each run creates a log file in your temp directory.
