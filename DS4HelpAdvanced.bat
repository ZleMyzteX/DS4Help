@echo off
title DS4HelpAdvanced

::admin check from stackoverflow! source: 
::https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file
::https://stackoverflow.com/a/40388766/13486323

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

echo [35m[DS4Help][0m this script stops all processes that block DS4Windows from using exclusive mode. 
echo [35m[DS4Help][0m checking if global user variable is set...

::check if ds4helppath exists or not. 
if "%DS4HelpPath%"=="" (
echo [35m[DS4Help][0m global user variable is not set.
goto :notset
) else (
echo [35m[DS4Help][0m global user variable is set as: "%DS4HelpPath%"
set /p answerfirst= "[35m[DS4Help][0m do you want to change it? [y/n] "
)

if /I "%answerfirst%"=="Y" goto :setagain 
if /I "%answerfirst%"=="N" goto :skipvar

:notset
echo [35m[DS4Help][0m add your directory to "DS4Windows.exe" so it can be launched automatically.
echo [35m[DS4Help][0m this variable will be set globally!
echo [35m[DS4Help][0m (for example: C:\Program Files (x86)\DS4Windows\DS4Windows.exe)

:: rundll32.exe sysdm.cpl,EditEnvironmentVariables

:setagain
set /p UserPath= "[35m[DS4Help][0m path to DS4Windows: "

echo [35m[DS4Help][0m path to DS4Windows will be set as: "%UserPath%"

:choices
set /p answer= "[35m[DS4Help][0m is this the correct path? [y/n] "
if /I "%answer%"=="Y" goto :answerYes 
if /I "%answer%"=="N" goto :setagain
goto :choices
::ask till answer is valid!

:answerYes 
setx DS4HelpPath "%UserPath%"

echo [35m[DS4Help][0m path to DS4Windows is set as: %DS4HelpPath%

:skipvar
echo [35m[DS4Help][0m press [32many key[0m to start stopping the processes.

pause > NUL
:: my approach is to simply try to kill every task, without checking if the task is running - could be done better for sure
:: it works like this though.
tasklist /FI "IMAGENAME eq DS4Windows.exe" 2>NUL | find /I /N "DS4Windows.exe">NUL
if "%ERRORLEVEL%"=="0" (
    @echo [35m[DS4Help][0m DS4Windows is running, stopping it to restart it later. 
	taskkill /f /im DS4Windows.exe 
)

:: origin 
@echo [35m[DS4Help][0m stopping gamelaunchers [origin, steam, epic, uplay]
taskkill /f /im origin.exe
:: steam processes
taskkill /f /im steam.exe 
taskkill /f /im steamcmd.exe
taskkill /f /im steamService.exe
taskkill /f /im steamwebhelper.exe
::uplay
taskkill /f /im upc.exe 
taskkill /f /im UplayWebCore.exe
::epic 
taskkill /f /im EpicGamesLauncher.exe

@echo [35m[DS4Help][0m stopping edge, windows store, netflix and the xbox gamebar. 
::misc
taskkill /f /im msedge.exe /t
taskkill /f /im WinStore.App.exe
taskkill /f /im WWAHost.exe
taskkill /f /im gamebar.exe

@echo [35m[DS4Help][0m all processes should be dead / were dead already. 
@echo [35m[DS4Help][0m checking for nvidia services.

sc query NvContainerLocalSystem | find "RUNNING"
if "%ERRORLEVEL%"=="0" (
    @echo [35m[DS4Help][0m NvContainerLocalSystem is running, stopping it...
	net stop NvContainerLocalSystem
) else (
    @echo [35m[DS4Help][0m NvContainerLocalSystem is already stopped. 
)

sc query NVDisplay.ContainerLocalSystem | find "RUNNING"
if "%ERRORLEVEL%"=="0" (
    @echo [35m[DS4Help][0m NVDisplay.ContainerLocalSystem is running, stopping it...
	net stop NVDisplay.ContainerLocalSystem
) else (
    @echo [35m[DS4Help][0m NVDisplay.ContainerLocalSystem is already stopped. 
)

@echo [35m[DS4Help][0m Services should be dead, starting DS4Windows.
start "" "%DS4HelpPath%"
@echo [35m[DS4Help][0m DS4Windows opened.
@echo [35m[DS4Help][0m if exclusive mode worked, press a key to restart nvidia services.

pause > NUL 

net start NvContainerLocalSystem
net start NVDisplay.ContainerLocalSystem

@echo [35m[DS4Help][0m services should be running again.
@echo [35m[DS4Help][0m thanks for using DS4Help - made by zle
@echo [35m[DS4Help][0m press any button to exit.
pause > NUL 
exit