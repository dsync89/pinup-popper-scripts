# D.Sync's PinUp Popper Scripts Collection

## Feature
- Store the script references such as paths to log file, extracted zip folder in a single `settings.ini` file.
- Systematic and clean logging system allowing you to know the exact command passed in the launch script
- Copy/Paste launcher batch file and you're done!

## Setup

Copy and paste all files in `scripts` folder to your `PinUp Popper root folder\Scripts`, e.g. `c:\PinUPSystem\Scripts\`

Modify `settings.ini` to setup the path.
```
; This file is read by other .bat file
[Paths]
LOGFILE=C:\PinUPSystem\log-launchscript.txt
ZIP_EXTRACT_FOLDER=r:\_pinup-popper-extracted-roms
```

Whenever the launch script is running, it will write logs to the `LOGFILE` defined in the settings files showing the paths for debugging purposes. This is very useful as there is no way to see the `echo` statement in Pinup Popper script system natively.

Example log content:
```
[2024-01-25 01:29] [Launcher][Nintendo SNES] Emu Run command: retroarch.exe -L cores\snes9x_libretro.dll "r:\roms-1g1r\system\nintendo-snes\3 Ninjas Kick Back (USA).zip" 
[2024-01-25 01:35] [Launcher][Nintendo Game Boy] Emu Run command: retroarch.exe -L cores\gambatte_libretro.dll "r:\roms-1g1r\system\nintendo-game-boy\Adventure Island (USA, Europe).zip" 
[2024-01-25 01:36] [Launcher][Nintendo Game Boy Advance] Emu Run command: retroarch.exe -L cores\mgba_libretro.dll "r:\roms-1g1r\system\nintendo-game-boy-advance\Altered Beast - Guardian of the Realms (USA).zip" 
[2024-01-25 01:36] [Launcher][Nintendo Game Boy Color] Emu Run command: retroarch.exe -L cores\gambatte_libretro.dll "r:\roms-1g1r\system\nintendo-game-boy-color\1942 (USA, Europe).zip" 
[2024-01-25 01:37] [Launcher][Nintendo Pokemon Mini] Emu Run command: retroarch.exe -L cores\pokemini_libretro.dll "r:\roms-1g1r\system\nintendo-pokemon-mini\Pokemon Party Mini - Chansey's Dribble (Europe) (GameCube).zip" 
[2024-01-25 01:40] [Launcher][Nintendo 64] Emu Run command: retroarch.exe -L cores\mupen64plus_next_libretro.dll "r:\roms-1g1r\system\nintendo-64-big-endian\Doom 64 (USA) (Rev 1).zip" 
[2024-01-25 01:41] [Launcher][Nintendo Famicom Disk System] Emu Run command: retroarch.exe -L cores\nestopia_libretro.dll "r:\roms-1g1r\system\nintendo-famicom-computer-disk-system-fds\Akumajou Dracula (Japan) (Rev 2) (Disk Writer).zip" 
[2024-01-25 01:42] [Launcher][Nintendo Entertainment System] Emu Run command: retroarch.exe -L cores\nestopia_libretro.dll "r:\roms-1g1r\system\nintendo-nes-headered\1942 (Japan, USA) (En).zip" 
[2024-01-25 01:43] [Launcher][Nintendo Wii] Emu Run command: retroarch.exe -L cores\dolphin_libretro.dll "s:\roms-1g1r\erista-redump-nintendo-wii\Action Girlz Racing (USA).zip" 
```

## Scripts
**Launcher batch file (paste to Emulator -> Launch)**

- `launch_retroarch_with_unzip.bat`: Unzip archive using 7zip before launching RetroArch
- `launch_retroarch.bat`: Feed zip file directly to RetroArch

**Helper Scripts**
These are some helper scripts used by the launcher script above, you shouldn't need to modify any of these.

- `extract_files.bat`
- `logger.bat`