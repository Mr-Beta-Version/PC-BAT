@echo off
echo Cleaning Temp and Prefetch files...
timeout /t 2 >nul

:: Delete Temp folder files
echo Deleting Temp folder files...
del /q /f /s %temp%\*
rmdir /q /s %temp%

:: Delete Prefetch folder files
echo Deleting Prefetch folder files...
del /q /f /s C:\Windows\Prefetch\*
echo All files deleted from Temp and Prefetch folders.

pause
exit
