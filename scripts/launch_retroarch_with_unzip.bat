REM Your main script
@echo off
setlocal

set "LOG_TAG=[Launcher]"

REM Read settings.ini
set "iniFile=C:\PinUPSystem\Scripts\settings.ini"
for /f "tokens=2 delims==" %%a in ('findstr /i "^LOGFILE=" "%iniFile%"') do set "LOGFILE=%%a"
for /f "tokens=2 delims==" %%a in ('findstr /i "^ZIP_EXTRACT_FOLDER=" "%iniFile%"') do set "ZIP_EXTRACT_FOLDER=%%a"

set "ROM_EXT=nds"

START "" "[STARTDIR]Launch\VPXSTARTER.exe" "RetroArch" 2 2 10

cd "[DIREMU]"

REM  ****  set default RetroArch Core DLL Here ****
REM  can override with altexe on game record
SET CORE=[DIRROM]

REM ----------------------------------------------------
REM Extract zip files
REM ----------------------------------------------------

REM Set the path to the ZIP file you want to extract
set "zipFilePath=[GAMEFULLNAME]"

REM Call the extraction batch file
call :log %LOG_TAG% Extract file bat: C:\PinUPSystem\Scripts\extract_files.bat "%zipFilePath%" "%ZIP_EXTRACT_FOLDER%" "[GAMENAME].%ROM_EXT%"
call C:\PinUPSystem\Scripts\extract_files.bat "%zipFilePath%" "%ZIP_EXTRACT_FOLDER%" "[GAMENAME].%ROM_EXT%"

REM ----------------------------------------------------

if "[ALTEXE]" NEQ "" (SET CORE=[ALTEXE])

call :log %LOG_TAG% Emu Run command: retroarch.exe -L cores\%CORE%  "%ZIP_EXTRACT_FOLDER%\[GAMENAME].%ROM_EXT%"
START "" retroarch.exe -L cores\%CORE%  "%ZIP_EXTRACT_FOLDER%\[GAMENAME].%ROM_EXT%"

endlocal
exit /b 0


REM ----------------------------------------------------
REM Functions from other .bat
REM ----------------------------------------------------
:log
call C:\PinUPSystem\Scripts\logger.bat %*
exit /b