#!/bin/sh
cd "`dirname "$0"`"
ADB=
if [ "$ANDROID_HOME" != "" ]; then ADB=$ANDROID_HOME/platform-tools/adb; else ADB=C:\NVPACK\android-sdk-windows/platform-tools/adb; fi
DEVICE=
if [ "$1" != "" ]; then DEVICE="-s $1"; fi
echo
echo Uninstalling existing application. Failures here can almost always be ignored.
$ADB $DEVICE uninstall com.YourCompany.AndroidProject
echo
echo Removing old data. Failures here are usually fine - indicating the files were not on the device.
$ADB $DEVICE shell 'rm -r $EXTERNAL_STORAGE/UE4Game/AndroidProject'
$ADB $DEVICE shell 'rm -r $EXTERNAL_STORAGE/UE4Game/UE4CommandLine.txt'
$ADB $DEVICE shell 'rm -r $EXTERNAL_STORAGE/obb/com.YourCompany.AndroidProject'
$ADB $DEVICE shell 'rm -r $EXTERNAL_STORAGE/Android/obb/com.YourCompany.AndroidProject'
echo
echo Uninstall completed
exit 0
