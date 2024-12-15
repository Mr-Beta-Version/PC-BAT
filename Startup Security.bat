@echo off
setlocal

:: Get the current time in minutes
for /f "tokens=1,2 delims=:" %%a in ("%time%") do set hour=%%a& set minute=%%b
set /a total_minutes=%hour%*60 + %minute%

:: Ask the user for their age in minutes with a timeout option
echo What is your age in minutes? Press any key to continue or wait 15 seconds to exit.
choice /t 15 /d N /n >nul

:: Check if the user force-exited by using Ctrl+C or if they timed out
if errorlevel 1 (
    echo Force exit or timed out. Shutting down in 15 seconds...
    timeout /t 15
    shutdown /s /f /t 0
    exit
)

:: Get the user's input for age in minutes
set /p age="Enter your age in minutes: "

:: Check if the age in minutes matches the current time in minutes
if "%age%"=="%total_minutes%" (
    echo WELCOME BOSS
    pause
) else (
    echo WELCOME
    timeout /t 30
    shutdown /s /f /t 0
)

exit
