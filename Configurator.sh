#!/bin/bash

if [[ "$1" == "configure" ]]; then
  echo "configuring.."
  if [[ "$2" == "--add-software" ]]; then
    installer_path="$3"
    software_name="$4"
    echo -n "start /wait $installer_path :: Install $software_name " >> SoftwareConf.conf
    echo -n "start /wait $installer_path :: Install $software_name "
    echo "CALL :IfMissingInstall $software_name" 
    echo "CALL :IfMissingInstall $software_name" >> installer.bat
  fi 
  if [[ "$2" == "--uninstall-software" ]]; then
  uninstaller_path="$3"
  software_name="$4"
  echo "CALL :IfPresentUninstall $software_name"
  echo "CALL :IfPresentUninstall $software_name" >> installer.bat
  echo -n "\"$uninstaller_path\" :: Uninstall $software_name " >> SoftwareConf.conf
  echo -n "\"$uninstaller_path\" :: Uninstall $software_name "
  fi 
else
  echo Not recognized argument "$1"
fi
