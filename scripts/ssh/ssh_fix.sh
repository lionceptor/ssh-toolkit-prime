#!/bin/bash
set -e

echo "[*] Fixing SSH permissions..."
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

echo "[*] Updating SSH server config..."
sed -i 's/^#*PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^#*PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config

echo "[*] Restarting SSH service..."
systemctl restart ssh || systemctl restart sshd

echo "[+] SSH fix complete. Verify login and then disable password authentication again."
