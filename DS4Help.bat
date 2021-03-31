@echo off
title DS4Help

::code from stackoverflow! source: 
::https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file
::https://stackoverflow.com/a/40388766/13486323

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

echo [35m[DS4Help][0m This script stops all processes that block DS4Windows from using exclusive mode. 
echo [35m[DS4Help][0m Press [32many key[0m to start stopping Game processes and Nvidia services.

pause > NUL

:: origin 
@echo [35m[DS4Help][0m stopping gamelaunchers [Origin, Steam, Epic, Utrash]
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

@echo [35m[DS4Help][0m stopping Edge, Windows Store, Netflix and the gamebar. 
::misc
taskkill /f /im msedge.exe /t
taskkill /f /im WinStore.App.exe
taskkill /f /im WWAHost.exe
taskkill /f /im gamebar.exe

@echo [35m[DS4Help][0m all processes should be dead / were dead already. 
@echo [35m[DS4Help][0m stopping nvidia services. 

net stop NvContainerLocalSystem 
net stop NVDisplay.ContainerLocalSystem

@echo [35m[DS4Help][0m Services should be dead, check if controller is in exclusive mode. 
@echo [35m[DS4Help][0m if exclusive mode worked, press a key to restart nvidia services.
@echo [35m[DS4Help][0m relaunching nvidia services automatically in 45 seconds.

timeout /T 45

net start NvContainerLocalSystem
net start NVDisplay.ContainerLocalSystem
@echo [35m[DS4Help][0m services should be running again.
@echo [35m[DS4Help][0m thanks for using ds4help - made by [35m.zle'[0m 
pause > NUL 
exit