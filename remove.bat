@echo off
:: Check if running as admin
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process cmd -Argument '/c %~s0' -Verb RunAs"
    exit /b
)

:: Execute the command
bcdedit -set TESTSIGNING OFF

:: Restart the PC
shutdown /r /t 0
