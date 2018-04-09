@echo off
REM because why not?
REM argument parsing and ping command from https://github.com/JustinSinc/Scripts/blob/master/drops.bat
REM javascript execution thanks to user Stephen Quan on Stack Overflow. (https://stackoverflow.com/a/47705748)

REM if no arguments were passed, print the command syntax
if [%1]==[] echo Usage: drops ^<ip_address^> & exit /b

REM if more than one argument was passed, error out
if not [%2]==[] echo Too many arguments & exit /b

set "input=%1"
cscript //nologo match.js "\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b" "%input%"
if errorlevel 1 echo Invalid IP address & exit /b

REM if the addresses seem fine, run the script
ping -t %1|cmd /q /v /c "(pause&pause)>nul & for /l %%a in () do (set /p "data=" && echo(!date! !time! !data!)&ping -n 2 localhost>nul" >> %userprofile%\Desktop\droppedpings-%1.txt