@echo off
setlocal

:: Get the current time in minutes
for /f "tokens=1,2 delims=:" %%a in ("%time%") do set hour=%%a& set minute=%%b


echo %minute%

:: Check if the user force-exited by using Ctrl+C or if they timed out
if errorlevel 1 (
    timeout /t 15
    shutdown /s /f /t 0
    exit
)


:: Get the user's input for age in minutes
set /p age="Enter your age: "

:: Check if the age in minutes matches the current time in minutes
if "%age%"=="%minute%" (
    echo WELCOME BOSS
    pause
) else (
    echo WELCOME
    timeout /t 30
    shutdown /s /f /t 0
)

exit
