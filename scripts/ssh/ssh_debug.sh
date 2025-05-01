#!/bin/bash
set -e

echo "[*] Checking SSH agent..."
ssh-add -l || echo "[!] No keys currently loaded."

echo "[*] Listing available SSH keys..."
ls -l ~/.ssh/*.pub

echo "[*] Displaying SSH config..."
cat ~/.ssh/config || echo "[!] No config found."

read -p "Enter server IP to test connection: " SERVER_IP
echo "[*] Running SSH connection test..."
ssh -vvv root@$SERVER_IP
