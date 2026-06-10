# HyperOS Monk Mode Debloater 🚀

A lightweight, automated ADB debloat and restore utility designed specifically for the Xiaomi 15T and HyperOS devices. 

This script safely strips away background analytics, duplicate Xiaomi apps, and unnecessary Google services via ADB without requiring root or an unlocked bootloader. Get your system as clean and disciplined as your mindset.

## ⚠️ Prerequisites
1. Enable Developer Options on your phone (Tap 'OS version' 7 times in settings).
2. Enable USB Debugging and USB Debugging (Security Settings).
3. Connect your device via USB and authorize the prompt on your phone screen.

## ⚙️ Installation
First, ensure you have ADB installed on your system (e.g., sudo pacman -S android-tools for Arch Linux). Then clone the repository:

```bash
git clone [https://github.com/DeepMillet/hyperos-monk-mode.git](https://github.com/DeepMillet/hyperos-monk-mode.git)
cd hyperos-monk-mode
chmod +x debloat.sh restore.sh


## 🛠️ Usage
1. Engage Monk Mode (Debloat)
Execute the main script to optimize your system. It safely categorizes the purge into Analytics, Xiaomi Bloat, and Google Bloat.

./debloat.sh


🟢 Revert Protocol (Restore)
Need a specific stock app back? This script instantly reinstalls all purged packages for the current user, bringing the system back to its original state.

./restore.sh

 
🛡️ Disclaimer


Safe Execution: This script removes packages strictly for the current user (⁠--user 0⁠). It does NOT delete system partitions and will NOT brick your device. A factory reset will permanently restore all stock applications



