# Aid
Repository for aiding in setting up my PC.

## Backup
Properly the most important thing. I am using Linux and will use `Borg Backup`. It is for Linux, but can be used in 
Windows with WSL. I will not do that though. I want to backup my `Sync/` folder. I use syncthing to synchronize files 
and folders across my devices. This folder contains the important things, which should also be backed up on an 
external harddrive. 

The first thing to do is create the repository. This should only be run once. Change the directory to the backup 
folder and run

```
borg init -e none ./
```

To create a backup of `~/Sync` you first run

```
borg create ./::sync-{now:%Y-%m-%d} ~/Sync
# if you want to exclude a folder (e.g. the books folder) use
borg create -e ~/Sync/Books ./::sync-{now:%Y-%m-%d} ~/Sync
```

Which will result in a archive named sync-YYYY-MM-DD. The name has to be unique and with this a backup can be taken 
every day. The plan is for weekly backups, so this is just fine. If you do not specify the format (e.g. ":%Y-%m-%d") 
then it will look like YYYY-MM-DDTHH:mm:ss.

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

Install RPMFusion and media codecs.

I am using following DNF packages (important)
```
wl-clipboard borgbackup speedcrunch tldr
```

Extras (mostly programming languages)
```
java-17-openjdk-javadoc java-17-openjdk-devel rust cargo latexmk
```

### Programming
This section is about setting a functioning programming environment. I often use `vscode`, `IntelliJ Idea` and 
`PyCharm` and will show how to set it up.

Manual installed applications will be placed in ~/Applications/

#### VSCode
Having downloaded `.tar.gz` file from VSCode (@ https://code.visualstudio.com/Download) do:

```
mkdir ~/Programmer # only first time
cd ~/Programmer # tar extracts to current directory
tar xf ~/Hentet/code-stable-x64-xxxxxxxxx.tar.gz
```

Then `~/Programmer/VSCode-linux-x64/` will contain VSCode.

##  Setup for Windows
The webbrowser is important. I use firefox, which can be downloaded from 
[mozilla.org](https://www.mozilla.org/firefox/download/thanks/).

I use Development IDEs from Jetbrains. Use [Toolbox App](https://www.jetbrains.com/toolbox-app/) to manage those.

[Visual Studio Code](https://code.visualstudio.com/) is also quite good.

### Applications from scoop
```
scoop install git
scoop bucket add extras
```
Setup scoop by following the commands at [scoop.sh](https://scoop.sh/) and then install the necessary applications with (you can add or delete whatever you need)
```
scoop install 7zip anki git libreoffice python speedcrunch syncthing temurin-lts-jdk vlc
```
