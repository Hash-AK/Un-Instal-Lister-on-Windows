ECHO OFF
:: PSTools\psinfo -s > c:/users/%username%/Desktop/psinfooutput.txt
::type SoftwareConf.conf|cmd
@echo off
setlocal enabledelayedexpansion

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


echo Listing direcotries in C:\Users\%username%\AppData\Local\Programs
dir /b /ad "C:\Users\%username%\AppData\Local\Programs" >> "%outputFile%"
:: Remove duplicate lines
sort "%outputFile%" /unique > temp.txt
move /y temp.txt "%outputFile%"

echo Done. Output saved to %outputFile%.


>nul find "Notepad++" c:/users/%username%/Desktop/installed_software-from-lsing-program-dirs.txt && (
  echo "Notepad++" was found, no need to install it.
) || (
  echo "Notepad++" was NOT found.
  type SoftwareConf.conf|find /I "Notepad++"|cmd
)
>nul find "Scratch" c:/users/%username%/Desktop/installed_software-from-lsing-program-dirs.txt && (
  echo "Scratch" was found.
) || (
  echo "Scratch" was NOT found.
  type SoftwareConf.conf|find /I "Scratch"|cmd
)
pause
