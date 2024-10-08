# Aid
Guide til opsætning af min PC (til mig).

## Setup

### Windows
#### Windows 11 N
Hvis man henter N udgaven af Windows, så skal man bagefter hente Media Feature Pack for at det fungerer optimalt. Dertil kan man bruge CLI (eller GUI). Brug
```PowerShell
DISM /Online /Get-Capabilities
```
til at få fat i navnet og
```PowerShell
Dism /Online /Add-Capability /CapabilityName:<name>
```
til at installere det.

Min foretrækne browser er i øjeblikket `Firefox`. Dens installer kan hentes
med dette direkte link 
[mozilla.org](https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=da). Man kan hente den i PowerShell med
```PowerShell
IWR -OutFile FirefoxSetup.exe "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=da"
```

Efter man har logget ind hentes udvidelserne automatisk.

Jeg har derudover brug for andre apps og værktøjer. Det er dejlig nemt at gøre 
med `scoop` [scoop.sh](https://scoop.sh/). Når det er sat op installeres
de nødvendige apps med

```
scoop bucket add extras
scoop install aria2
scoop install 7zip anaconda3 anki aria2 audacity dark ddu discord dotnet-sdk ffmpeg gimp git go godot-mono gradle-bin hyperfine inkscape innounp JetBrains-Mono libreoffice mattermost mingw mpc-hc-fork mumble nodejs-lts obs-studio okular pnpm powertoys python qalculate qpdf rcedit restic rufus rustup-gnu speedcrunch sweethome3d syncthing syncthingtray tealdeer temurin-lts-jdk tokei typst vcredist vcredist2005 vcredist2008 vcredist2010 vcredist2012 vcredist2013 vim vimtutor vlc vscode wireguard-np yt-dlp
```

Derudover skal jeg huske
- Generere nye ssh-nøgler
- Indstille GitHub og GitLab til at bruge disse
- Indstille `ssh-agent`, så jeg slipper for at huske koderne
Jeg vil ikke bruge tid på at genfortælle hvordan man gør, men i stedet henvise til 
[docs.github.com](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

Jeg er meget glad for `JetBrains` produkter, som jeg har mulighed for at bruge
gennem studiet. En nem måde at håndtere dem på er gennem `Toolbox App` 
[jetbrains.com](https://www.jetbrains.com/toolbox-app/).

WSL



### Linux (Fedora)


## Vedligeholdelse

I og med `scoop` anvendes på Windows kan man også dejlig nemt opdatere ens
programmer med
```
scoop update *
```
og fjerne tidligere installationsprogrammer med
```
scoop cleanup *
```

### Sikkerhedskopi
Jeg har heldigvis ikke haft brug for backups endnu, men hellere være forberedt,
end at blive taget med bukserne nede. Jeg bruger både Windows og Linux. 
Det er i øjeblikket primært Windows, men det er alligevel nødvendigt med et
program, som understøtter begge. Det gør `restic` 
[restic.net](https://restic.net/).

#### Brug
Hvis man gerne vil tage en backup af `Sync` mappen i repo `.` bruges
```
restic --repo . backup $HOME\Sync\
```
Det er denne mappe, som indeholder tingene, der skal sikkerhedskopieres.
