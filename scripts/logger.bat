@echo off

REM Get the log file path
for /f "tokens=2 delims==" %%a in ('findstr /i "^LOGFILE=" "%iniFile%"') do set "LOGFILE=%%a"

REM Get the current date and time
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set "datetime=%%a"

REM Format the date and time
set "formattedDatetime=[%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2% %datetime:~8,2%:%datetime:~10,2%]"

REM Function to print log messages with formatted datetime
:log
echo %formattedDatetime% %* >> %LOGFILE%
exit /b
