# Restic Backup and Restoration Guide

This document describes the prerequisites, script details, and steps required to restore backed-up system files and user data using Restic.

## System Prerequisites

To back up or restore data on a fresh operating system installation, the target system must satisfy the following requirements:

1. Restic must be installed using the system package manager.
2. The user must have read access to the backup repository location, such as a mounted external hard drive or a synced Nextcloud folder.
3. The repository encryption password must be available.

## Restoration Procedure

Follow these steps to inspect and restore data on a new installation.

### Step 1: Verify Snapshot Availability

Connect the backup media or mount the repository path. Open a terminal and list all available snapshots by running the following command. You will be prompted to enter your repository password.

```sh
restic -r /path/to/repository snapshots
```

### Step 2: Restore Files to a Temporary Directory

It is best practice to restore files to a temporary location before placing them into their final destination directories. To extract the latest complete snapshot, execute:

```sh
restic -r /path/to/repository restore latest --target /tmp/restored-data
```

To extract only specific directories, such as your user files or SSH keys, use the include flag:

```sh
restic -r /path/to/repository restore latest --target /tmp/restored-data --include /home/nikolaj/Sync --include /home/nikolaj/.ssh
```

### Step 3: Relocate Restored Files

Once the extraction completes, copy or move the files to their respective locations on the system.

For personal work and Obsidian vaults, move the contents directly to your home folder:

```sh
mv /tmp/restored-data/home/nikolaj/Sync ~/Sync
```

For Flatpak applications like Signal, Chatterino, or Bottles, install the respective Flatpak applications first to initialize their default directory structures, then copy the restored data:

```sh
cp -r /tmp/restored-data/home/nikolaj/.var/app/org.signal.Signal ~/.var/app/
```

For Wi-Fi connections, copy the restored configuration files back into NetworkManager, apply root permissions, and reload the service:

```sh
sudo cp /tmp/restored-data/home/nikolaj/.config/NetworkManager/connections-dump/* /etc/NetworkManager/system-connections/
sudo chmod 600 /etc/NetworkManager/system-connections/*
sudo nmcli connection reload
```

After completing the restoration, verify that your files are intact and remove the temporary folder in `/tmp/restored-data`.