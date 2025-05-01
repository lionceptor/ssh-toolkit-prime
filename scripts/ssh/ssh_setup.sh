#!/bin/bash
set -e

echo "[*] Checking for existing SSH key..."
KEY_PATH=~/.ssh/id_rsa
if [ ! -f "$KEY_PATH" ]; then
    echo "[+] No SSH key found. Generating..."
    ssh-keygen -t rsa -b 4096 -f $KEY_PATH -N ""
else
    echo "[+] SSH key exists."
fi

echo "[*] Adding key to ssh-agent..."
eval "$(ssh-agent -s)"
ssh-add $KEY_PATH

echo "[*] Creating SSH config entry..."
HOST_ALIAS="droplet"
read -p "Enter server IP: " SERVER_IP

mkdir -p ~/.ssh
cat <<EOF >> ~/.ssh/config

Host $HOST_ALIAS
    HostName $SERVER_IP
    User root
    IdentityFile $KEY_PATH
EOF

echo "[*] Copying public key to server..."
ssh-copy-id root@$SERVER_IP

echo "[+] SSH setup complete. Connect using: ssh $HOST_ALIAS"
