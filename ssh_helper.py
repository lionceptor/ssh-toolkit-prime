#!/usr/bin/env python3
import os
import subprocess
import sys

TOOLS = {
    "1": ("Run SSH Setup", "bash scripts/ssh/ssh_setup.sh"),
    "2": ("Run SSH Debug", "bash scripts/ssh/ssh_debug.sh"),
    "3": ("Run SSH Fix (server-side only)", "bash scripts/ssh/ssh_fix.sh"),
    "4": ("View Emergency Instructions", "less docs/ssh_emergency.txt"),
    "q": ("Exit", None)
}

def print_menu():
    os.system("clear")
    print("\n=== SSH TOOLKIT PRIME ===")
    print("Modular SSH diagnostics + recovery interface\n")
    for key, (desc, _) in TOOLS.items():
        print(f"[{key}] {desc}")
    print("\nSelect an option:")

def main():
    while True:
        print_menu()
        choice = input("> ").strip()
        if choice == "q":
            print("Exiting...")
            sys.exit(0)
        elif choice in TOOLS:
            _, cmd = TOOLS[choice]
            if cmd:
                subprocess.run(cmd, shell=True)
        else:
            print("Invalid selection. Try again.")
            input("\nPress Enter to continue...")

if __name__ == "__main__":
    main()
