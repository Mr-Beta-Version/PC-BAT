@echo off
title Windows Speed Booster
color 0A
echo ============================================================
echo            Windows Speed Booster - Optimizing Performance  
echo ============================================================
echo.

:: Run as Administrator
echo [INFO] Checking for Administrator privileges...
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [X] Please run this script as Administrator!
    pause
    exit
)

:: 1. Clean temporary files
echo [INFO] Cleaning temporary files...
del /s /f /q C:\Windows\Temp\* >nul 2>&1
del /s /f /q %temp%\* >nul 2>&1
rd /s /q C:\Windows\Temp
rd /s /q %temp%
md C:\Windows\Temp
md %temp%

:: 2. Clear Windows Prefetch
echo [INFO] Clearing Prefetch files...
del /s /f /q C:\Windows\Prefetch\* >nul 2>&1

:: 3. Stop unnecessary services
echo [INFO] Disabling unnecessary services...
sc config "SysMain" start=disabled
sc config "DiagTrack" start=disabled
sc config "dmwappushservice" start=disabled

:: 4. Enable High-Performance Power Plan
echo [INFO] Setting power mode to High Performance...
powercfg -setactive SCHEME_MIN

:: 5. Flush DNS Cache
echo [INFO] Flushing DNS cache...
ipconfig /flushdns

:: 6. Speed up shutdown time
echo [INFO] Reducing shutdown timeout...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f

:: 7. Clear Pagefile on Shutdown (Optional)
echo [INFO] Enabling Pagefile cleanup on shutdown...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f

:: 8. Restart Explorer to Apply Changes
echo [INFO] Restarting Windows Explorer...
taskkill /f /im explorer.exe
start explorer.exe

echo ============================================================
echo [OK] Optimization complete! Restart is recommended.
echo ============================================================
pause
exit
