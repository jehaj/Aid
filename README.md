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

## Setup

### Programming
This section is about setting a functioning programming environment. I often use `vscode`, `IntelliJ Idea` and `PyCharm` and will show how to set it up.


