@echo off
mode con: cols=80 lines=20

:: Initialize unique log file with timestamp
set "TIMESTAMP=%date:~-4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
set "LOG_FILE=%temp%\launch_log_%TIMESTAMP%.txt"
echo [%date% %time%] Starting script > "%LOG_FILE%" 2>&1

:: Check for admin privileges
net session >nul 2>&1
if %errorlevel% == 0 (
    echo Running with admin privileges
    echo [%date% %time%] Running with admin privileges >> "%LOG_FILE%" 2>&1
) else (
    echo Requesting administrative privileges...
    echo [%date% %time%] Requesting administrative privileges... >> "%LOG_FILE%" 2>&1
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\elevate.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\elevate.vbs"
    wscript "%temp%\elevate.vbs" >> "%LOG_FILE%" 2>&1
    if exist "%temp%\elevate.vbs" del "%temp%\elevate.vbs"
    exit /b
)

:: Display ASCII art
echo.
echo ________               .__                    _____             .___      
echo /  _____/_____    _____ ^|__^| ____    ____     /     \   ____   __^| _/____  
echo /   \  ___\__  \  /     \ ^| ^|/    \  / ___\   /  \ /  \ /  _ \ / __ ^|/ __ \ 
echo \    \_\  \/ __ \^|  Y Y  \ ^|   ^|  \/ /_/  ^> /    Y    (  ^<_^> ) /_/ \  ___/ 
echo \______  (____  /__^|_^|  /__^|___^|  /\___  /  \____^|__  /\____/\____ ^|\___  ^>
echo        \/     \/      \/        \//_____/           \/            \/    \/ 
echo.
echo [%date% %time%] Displaying ASCII art >> "%LOG_FILE%" 2>&1

:: Define program paths
set "STEAM_PATH=C:\Program Files (x86)\Steam\steam.exe"
set "DISCORD_UPDATE_PATH=%LocalAppData%\Discord\Update.exe"
set "MSI_PATH=C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe" /s
set "RTSS_PATH=C:\Program Files (x86)\RivaTuner Statistics Server\RTSS.exe"

:: Launch Steam
echo Launching Steam...
echo [%date% %time%] Launching Steam: %STEAM_PATH% >> "%LOG_FILE%" 2>&1
start "" "%STEAM_PATH%"
timeout /t 1 /nobreak >nul

:: Launch Discord
echo Launching Discord...
echo [%date% %time%] Launching Discord: %DISCORD_UPDATE_PATH% >> "%LOG_FILE%" 2>&1
start "" "%DISCORD_UPDATE_PATH%" --processStart Discord.exe
timeout /t 1 /nobreak >nul

:: Launch MSI Afterburner
echo Launching MSI Afterburner...
echo [%date% %time%] Launching MSI Afterburner: %MSI_PATH% >> "%LOG_FILE%" 2>&1
start "" "%MSI_PATH%"
timeout /t 1 /nobreak >nul

:: Launch RivaTuner Statistics Server
echo Launching RivaTuner Statistics Server...
echo [%date% %time%] Launching RivaTuner: %RTSS_PATH% >> "%LOG_FILE%" 2>&1
start "" "%RTSS_PATH%"
timeout /t 1 /nobreak >nul

:: Log completion
echo Script completed
echo [%date% %time%] Script completed >> "%LOG_FILE%" 2>&1
pause