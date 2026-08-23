# Backup

The backup script [`backup.sh`](backup.sh) simplifies my backup process. It uses `restic`. It allows for multiple repositories in different locations if they use the same password. The password must live in your kde wallet under `restic` > `backup`.

The script backs up the following:
- Personal files from `$HOME/Sync`
- Browser data: Firefox, Brave
- Flatpak apps: Brave, Chatterino, Signal, Bottles
- SSH keys, GPG keys, KWallet
- NetworkManager connections

Run [`backup.sh`](backup.sh).

For restoring the backup see [`restore.md`](restore.md).
