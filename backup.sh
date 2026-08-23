#!/bin/bash

set -euo pipefail

# Set working directory
cd "$HOME" || exit 1

# Define variables
WALLET_FOLDER="restic"
WALLET_KEY="backup"
DUMP_DIR="$HOME/.config/NetworkManager/connections-dump"

# Cleanup function to securely remove temporary network dumps
cleanup() {
    if [ -d "$DUMP_DIR" ]; then
        echo "$(date) - Cleaning up temporary Wi-Fi dumps..."
        rm -rf "$DUMP_DIR"
    fi
}

# Trap EXIT, INT, and TERM signals so cleanup ALWAYS runs on exit or crash
trap cleanup EXIT INT TERM

# Define repositories to back up to
# Format: Path or URL
REPOS=(
    "/run/media/nikolaj/VERBATIM HD/Backups/Backup af Windows (Restic)"
    "$HOME/Nextcloud/Backup"
)

# Define directories/files to back up
PATHS=(
    "$HOME/Sync"
    "$HOME/Hentet"
    "$HOME/Skrivebord"
    "$HOME/Billeder"
    "$HOME/Videoklip"
    "$HOME/Dokumenter"
    "$HOME/.mozilla/firefox"
    "$HOME/.var/app/com.brave.Browser"
    "$HOME/.var/app/com.chatterino.chatterino"
    "$HOME/.var/app/org.signal.Signal"
    "$HOME/.var/app/com.usebottles.bottles"
    "$HOME/.ssh"
    "$HOME/.gnupg"
    "$HOME/.local/share/kwalletd"
    "$HOME/.config/NetworkManager/connections-dump" # Exported NM files
)

# Common excludes to save space and prevent DB locking issues
EXCLUDES=(
    "--exclude=$HOME/.mozilla/firefox/*/cache2"
    "--exclude=$HOME/.mozilla/firefox/*/storage/default"
    "--exclude=*/cache"
    "--exclude=*/.cache"
    "--exclude=*/Cache"
    "--exclude=*.tmp"
)

# 1. Retrieve password from KDE Wallet
PASSWORD=$(kwallet-query -f "$WALLET_FOLDER" --read-password "$WALLET_KEY" kdewallet)

if [ -z "$PASSWORD" ]; then
    echo "$(date) - Failed to retrieve password from KDE Wallet"
    exit 1
fi

export RESTIC_PASSWORD="$PASSWORD"

# 2. Dump Wi-Fi connections, fix ownership for restic
if command -v pkexec &> /dev/null; then
    mkdir -p "$DUMP_DIR"
    pkexec sh -c "cp -r /etc/NetworkManager/system-connections/* '$DUMP_DIR/' 2>/dev/null && chown -R $USER:$USER '$DUMP_DIR' && chmod 700 '$DUMP_DIR' && chmod -R u+rwX '$DUMP_DIR'"
fi

# 3. Iterate over defined repositories
for REPO in "${REPOS[@]}"; do
    echo "$(date) - Checking repository: $REPO"

    # Verify if repo target exists (essential for external HDDs)
    if [ ! -d "$REPO" ]; then
        echo "$(date) - Repository target '$REPO' not available/mounted. Skipping."
        continue
    fi

    echo "$(date) - Starting restic backup for $REPO"

    restic -r "$REPO" backup "${PATHS[@]}" "${EXCLUDES[@]}"

    if [ $? -eq 0 ]; then
        echo "$(date) - Backup successful for $REPO"
        restic -r "$REPO" forget --keep-daily 7 --keep-weekly 4 --keep-monthly 12 --keep-yearly 1 --prune
        notify-send "Restic Backup" "Successfully backed up to:\n$REPO"
    else
        echo "$(date) - Backup failed for $REPO"
        notify-send -u critical "Restic Backup" "Backup FAILED for:\n$REPO"
    fi
done
