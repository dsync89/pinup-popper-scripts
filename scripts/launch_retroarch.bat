REM Your main script
@echo off
setlocal

set "LOG_TAG=[Launcher][Nintendo SNES]"

REM Read settings.ini
set "iniFile=C:\PinUPSystem\Scripts\settings.ini"
for /f "tokens=2 delims==" %%a in ('findstr /i "^LOGFILE=" "%iniFile%"') do set "LOGFILE=%%a"

START "" "[STARTDIR]Launch\VPXSTARTER.exe" "RetroArch" 2 2 10

cd "[DIREMU]"

REM  ****  set default RetroArch Core DLL Here ****
REM  can override with altexe on game record
SET CORE=[DIRROM]

if "[ALTEXE]" NEQ "" (SET CORE=[ALTEXE])

call :log %LOG_TAG% Emu Run command: retroarch.exe -L cores\%CORE% "[GAMEFULLNAME]"
START "" retroarch.exe -L cores\%CORE% "[GAMEFULLNAME]"

endlocal
exit /b 0


REM ----------------------------------------------------
REM Functions from other .bat
REM ----------------------------------------------------
:log
call C:\PinUPSystem\Scripts\logger.bat %*
exit /b