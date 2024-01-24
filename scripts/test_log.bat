REM Your main script
@echo off
setlocal

REM Import log function
call :log "Hello I'm good!""

endlocal
exit /b 0

REM ----------------------------------------------------
REM Functions from other .bat
REM ----------------------------------------------------
:log
call C:\PinUPSystem\Scripts\logger.bat %*
exit /b