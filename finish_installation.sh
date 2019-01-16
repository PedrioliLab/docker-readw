#!/bin/bash

## Initialize wine installation
wineboot --init

## Install VC++ runtime 2010
## This is required for mfc100.dll
winetricks -q vcrun2010

## Install VC++ runtime 2008
winetricks -q vcrun2008

## Install RAW file DLLs
if [ ! -e /install/ReAdW_DLLs ]
   then
       echo "Please create a folder named ReAdW_DLLs containing:"
       echo "XRawfile2.dll"
       echo "fielio.dll"
       echo "fregistry.dll"
       exit 1
fi
cp -r /install /install/ReAdW_DLLs /home/user/drive_c/

## Register Thermo DDLs
regsvr32 /home/user/drive_c/ReAdW_DLLs/XRawfile2.dll

## End wine session and shutdown
wineboot -e
wineboot -s

## Setup up new entrypoint
sudo cp /install/entrypoint.sh /usr/local/bin
sudo chmod 755 /usr/local/bin/entrypoint.sh
