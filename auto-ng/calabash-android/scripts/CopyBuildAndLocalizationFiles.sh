#!/bin/bash
# by Almas
# Modified by Devin 4/9/13

component=$3
proj=$4

rm -f /opt/auto-ng/calabash-android/Main/Project/OpenMobileAndroidClient.apk
rm -f /opt/auto-ng/calabash-android/Main/Project-WFM/WiFiMobilize.apk
#mkdir -p /opt/OpenMobileIOSInstaller/Localization

# Copy the build
cp -r /mnt/mvm-store/iPass_Clients/Open_Mobile_Android/All_Builds/$1/$2/Default/Installer/OpenMobileAndroidClient.apk /opt/auto-ng/calabash-android/Main/Project/
cp -r /mnt/mvm-store/iPass_Clients/Open_Mobile_WFM/All_Builds/$1/$2/Default/Installer/WiFiMobilize.apk /opt/auto-ng/calabash-android/Main/Project-WFM/
# Install APKs
/opt/auto-ng/calabash-android/scripts/installation.rb "$component" "$proj"

# Copy Loc files
# Talk to Raul to copy over localization files
#scp -r transfer@10.10.230.77:./iPass_Clients/Open_Mobile_iOS/All_Builds/$1/$2/Localization/Shared/* /opt/OpenMobileIOSInstaller/Localization 

