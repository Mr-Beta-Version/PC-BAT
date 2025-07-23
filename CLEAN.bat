@echo off
title System Cleaner by Muhammad Walid

:: Credit
echo -----------------------------------------
echo        System Cleaner Script
echo     Created by: Muhammad Walid
echo -----------------------------------------
echo.
echo Cleaning system junk files...
timeout /t 2 >nul

:: Temp folders
echo Deleting %temp%...
del /f /s /q "%temp%\*"
rmdir /s /q "%temp%"

echo Deleting C:\Windows\Temp...
del /f /s /q "C:\Windows\Temp\*"
rmdir /s /q "C:\Windows\Temp"

:: Prefetch folder
echo Deleting Prefetch files...
del /f /s /q "C:\Windows\Prefetch\*"

:: SoftwareDistribution (Windows Update leftovers)
echo Cleaning Windows Update leftovers...
del /f /s /q "%SystemRoot%\SoftwareDistribution\Download\*"

:: INetCache
echo Cleaning browser cache...
del /f /s /q "%LocalAppData%\Microsoft\Windows\INetCache\*"

:: Windows Error Reporting
echo Cleaning error logs...
del /f /s /q "%LocalAppData%\Microsoft\Windows\WER\*"

:: CrashDumps
echo Cleaning crash dumps...
del /f /s /q "%LocalAppData%\CrashDumps\*"

:: UWP App Cache (optional)
echo Cleaning UWP app data...
del /f /s /q "%LocalAppData%\Packages\*"

echo.
echo Cleanup Complete!
echo.
echo -----------------------------------------
echo     Cleaned by Muhammad Walid 
echo -----------------------------------------
pause
exit
