# SSH Toolkit Prime

A minimal, modular SSH access and recovery toolkit built for engineers managing remote infrastructure — originally engineered for the Atlas Prime project.

[→ View on GitHub](https://github.com/lionceptor/ssh-toolkit-prime)

---

## Contents

- `ssh_setup.sh`: Generate and configure SSH key-based access
- `ssh_debug.sh`: Run diagnostic checks from your local system
- `ssh_fix.sh`: Repair server-side SSH config (to be run on remote)
- `ssh_helper.py`: Menu-driven interface for all scripts
- `ssh_emergency.txt`: Recovery instructions for when all else fails

---

## Usage

```bash
# Setup SSH access
bash scripts/ssh/ssh_setup.sh

# Debug your SSH connection (local)
bash scripts/ssh/ssh_debug.sh

# Repair a server's SSH config (remote)
bash scripts/ssh/ssh_fix.sh

# Use the menu interface
python ssh_helper.py
```

---

## Emergency Recovery
See `docs/ssh_emergency.txt` for full console recovery walkthrough, including:
- Enabling password login temporarily
- Resetting root password
- Re-establishing public key authentication

---

## Recommendations

- 🔒 Always disable password login after regaining access
- 🔑 Back up SSH keys securely
- 🧠 Use key passphrases or hardware tokens when possible

---

## License

[MIT](./LICENSE)

---

## Contributing

PRs welcome. If you have improvements, fixes, or extensions, open a pull request or issue.

```bash
git clone https://github.com/lionceptor/ssh-toolkit-prime.git
cd ssh-toolkit-prime
git checkout -b feature/something-new
```
