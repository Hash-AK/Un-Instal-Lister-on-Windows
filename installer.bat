
:: PSTools\psinfo -s > c:/users/%username%/Desktop/psinfooutput.txt
::type SoftwareConf.conf|cmd
@echo off
setlocal enabledelayedexpansion
echo This script will clean your terminal before starting. Press any key to operate
pause
cls
:: Define output file
set outputFile=c:\users\%username%\desktop\installed_software-from-lsing-program-dirs.txt

:: Clear the output file if it exists
> "%outputFile%" echo.

:: List directories in Program Files
echo Listing Program Files...
dir /b /ad "C:\Program Files" >> "%outputFile%"

:: List directories in Program Files (x86)
echo Listing Program Files (x86)...
dir /b /ad "C:\Program Files (x86)" >> "%outputFile%"

:: List directories in AppData\Local\
echo Listing directories in C:\Users\%username%\AppData\Local\Programs
dir /b /ad "C:\Users\%username%\AppData\Local\Programs" >> "%outputFile%"
:: Remove duplicate lines
sort "%outputFile%" /unique > temp.txt
move /y temp.txt "%outputFile%"

echo Done. Output saved to %outputFile%.

:: Starting the Research in the outputed file to find occurence of the tag 

CALL :IfMissingInstall Notepad++
CALL :IfMissingInstall Scratch
CALL :IfMissingInstall Arduino
CALL :IfMissingInstall Brave
:IfMissingInstall
>nul find "%~1" c:/users/%username%/Desktop/installed_software-from-lsing-program-dirs.txt && (
  echo "%~1" was found, no need to install it.
) || (
  echo "%~1" was NOT found, installing it...
  type SoftwareConf.conf|find /I "%~1"|cmd
)
EXIT /B 0

::>nul find "Scratch" c:/users/%username%/Desktop/installed_software-from-lsing-program-dirs.txt && (
::  echo "Scratch" was found, no need to install it.
::) || (
::  echo "Scratch" was NOT found, installing it....
::  type SoftwareConf.conf|find /I "Scratch"|cmd
::)
::>nul find "Arduino" c:/users/%username%/Desktop/installed_software-from-lsing-program-dirs.txt && (
::  echo "Arduino" was found, no need to install it.
::) || (
::  echo "Arduino" was NOT found, installing it from Arduino 2.3.2...
::  type SoftwareConf.conf|find /I "Arduino 2.3.2"|cmd
::)
::>nul find "Brave" c:/users/%username%/Desktop/installed_software-from-lsing-program-dirs.txt && (
::  echo "Brave was found, no need to install it.
::) || (
::  echo "Brave was NOT found, installing it...
::  type SoftwareConf.conf|find /I "Brave"|cmd
::)
