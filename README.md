# Aid
Repository for aiding in setting up my PC.

## Backup
Properly the most important thing. I am using Linux and will use `Borg Backup`. It is for Linux, but can be used in Windows with WSL. I will not do that though. I want to backup my `Sync/` folder. I use syncthing to synchronize files and folders across my devices. This folder contains the important things, which should also be backed up on an external harddrive. 

The first thing to do is create the repository. This should only be run once. Change the directory to the backup folder and run

```
borg init -e none ./
```

To create a backup of `~/Sync` you first  run

```
borg create ./::sync-{now:%Y-%m-%d} ~/Sync
```

Which will result in a archive named sync-YYYY-MM-DD. The name has to be unique and with this a backup can be taken every day. The plan is for weekly backups, so this is just fine. If you do not specify the format (e.g. ":%Y-%m-%d") then it will look like YYYY-MM-DDTHH:mm:ss.

If you want to view the archives in the backup folder you can run

```
borg list .
```

If you want to view the contents of the archive then run

```
borg list .::<name of archive>
```

To restore a backup you can use

```
borg extract /path/to/repo::<name of archive>
```

Be aware that the archive will be extracting the files relative to the current directory.


## Setup for Linux (Fedora)

### Programming
This section is about setting a functioning programming environment. I often use `vscode`, `IntelliJ Idea` and `PyCharm` and will show how to set it up.

Manual installed applications will be placed in ~/Applications/

# VSCode

Download

##  Setup for Windows
The webbrowser is important. I use firefox, which can be downloaded from [mozilla.org](https://www.mozilla.org/firefox/download/thanks/).

### Applications from scoop
```
scoop install git
scoop bucket add extras
```
Setup scoop by following the commands at [scoop.sh](https://scoop.sh/) and then install the necessary applications with (you can add or delete whatever you need)
```
scoop install 7zip anki audacity blender curl ffmpeg git go idea kdenlive libreoffice notepadplusplus powertoys python scoop-search speedcrunch sweethome3d syncthing temurin-lts-jdk vlc vscode windirstat
```

