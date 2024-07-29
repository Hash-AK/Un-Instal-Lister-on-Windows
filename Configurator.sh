#!/bin/bash

if [[ "$1" == "configure" ]]; then
  echo "configuring.."
  if [[ "$2" == "--add-software" ]]; then
    installer_path="$3"
    software_name="$4"
    echo "start /wait $installer_path :: $software_name " >> SoftwareConf.conf
    echo "CALL :IfMissingInstall $4" 
    echo "CALL :IfMissingInstall $4" >> installer.bat
  fi 
else
  echo Not recognized argument "$1"
fi
