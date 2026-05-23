#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "=== 1. Updating and Upgrading the System ==="
sudo apt update
sudo apt upgrade -y

echo "=== 2. Installing VLC Media Player ==="
sudo apt install -y vlc

echo "=== 5. Stripping Non-Essential Applications (Debloat) ==="
sudo apt purge -y \
  libreoffice-core \
  libreoffice-common \
  thunderbird \
  aisleriot \
  gnome-mahjongg \
  gnome-mines \
  gnome-sudoku \
  remmina \
  shotwell \
  rhythmbox \
  totem

echo "=== 6. Performance Optimizations for Older Hardware ==="

# A. Disable GNOME Desktop Animations (Instant window opening)
echo "--> Disabling UI animations for snappier windows..."
gsettings set org.gnome.desktop.interface enable-animations false

# B. Lower "Swappiness" (Keeps things in RAM longer instead of hitting slow storage)
echo "--> Optimizing virtual memory usage (swappiness)..."
sudo bash -c "echo 'vm.swappiness=10' >> /etc/sysctl.conf"
sudo sysctl -p

# C. Purge Tracking & Indexing Services (Huge CPU/Battery savers on tablets)
echo "--> Removing background file indexer (Tracker) and error reporters..."
# Tracker indexes files constantly in the background, which destroys older disk performance
sudo apt purge -y tracker tracker-extract tracker-miner-fs 2>/dev/null || true
# Remove Apport (the popup that asks to submit crash reports)
sudo apt purge -y apport apport-gtk 2>/dev/null || true
# Remove Popularity Contest (background telemetry)
sudo apt purge -y popularity-contest 2>/dev/null || true

echo "=== 7. System Cleanup ==="
sudo apt autoremove -y
sudo apt clean

echo "=== 8. Bypassing GRUB Boot Menu for Faster Booting ==="
# Backup the original configuration just in case
sudo cp /etc/default/grub /etc/default/grub.bak

# Modify the GRUB configuration file
# Sets the timeout to 0 seconds and hides the menu
sudo sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=0/' /etc/default/grub
sudo sed -i 's/GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=hidden/' /etc/default/grub

# Enforce hiding settings on newer Ubuntu versions
if ! grep -q "GRUB_RECORDFAIL_TIMEOUT" /etc/default/grub; then
    sudo bash -c "echo 'GRUB_RECORDFAIL_TIMEOUT=0' >> /etc/default/grub"
fi

# Apply the changes to the system bootloader
sudo update-grub

echo "=== Optimization Complete! Please restart your tablet to apply all changes. ==="
