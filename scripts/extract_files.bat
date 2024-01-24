@echo off
set "LOG_TAG=[Utils][Extract Files]"

REM Read settings.ini
set "iniFile=C:\PinUPSystem\Scripts\settings.ini"

REM Set the path to 7-Zip installation
set "sevenZipPath=C:\Program Files\7-Zip"

REM Set the path to the ZIP file to extract
set "zipFilePath=%~1"

REM Set the destination folder for extraction
set "extractedFolderPath=%~2"

REM Game Full name with ext, e.g. Aladdin.zip
set "gameName=%~3"

REM Check if the ZIP file exists
@REM if not exist "%zipFilePath%" (
@REM     echo ZIP file does not exist. Exiting. >> %LOGFILE%
@REM     exit /b 1
@REM )

REM Check if the extracted folder already contains the contents
set "targetPath=%extractedFolderPath%\%gameName%"
if exist "%targetPath%" (
    call :log %LOG_TAG% Zip file already exists. Skipping extraction.
) else (
    REM Ensure the extracted folder exists or create it
    if not exist "%extractedFolderPath%" mkdir "%extractedFolderPath%"

    REM Use 7-Zip to extract the ZIP file (use quotes around the path)
    call :log %LOG_TAG% Extract command: "%sevenZipPath%\7z.exe" x "%zipFilePath%" -o"%extractedFolderPath%"
    "%sevenZipPath%\7z.exe" x "%zipFilePath%" -o"%extractedFolderPath%"
    if %errorlevel% neq 0 (
        call :log %LOG_TAG% Extraction failed. Exiting.
        exit /b %errorlevel%
    )
)

REM ----------------------------------------------------
REM Functions from other .bat
REM ----------------------------------------------------
:log
call C:\PinUPSystem\Scripts\logger.bat %*
exit /b