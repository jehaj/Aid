# Aid
Repository for aiding in setting up my PC.

## Backup
Properly the most important thing. I am using Linux and will use `Borg Backup`. I want to save some parts of my `home` directory - specifically `Documents`, `Pictures`, `Videos`, `.eduroam` and `Downloads`. If the need arises then it is easy to add more directories.
```
$ borg init -e none <empty directory for backup>
```

I also have a folder for different books. The syntax is very similar to before, but for convenience it is inserted below
```
$ borg create <repository>::<name> <folders...>
```

Extract a previous backup
```
$ borg extract <repository>::<name> <target>
```

## Setup for Linux (Fedora)

### Programming
This section is about setting a functioning programming environment. I often use `vscode`, `IntelliJ Idea` and `PyCharm` and will show how to set it up.

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

