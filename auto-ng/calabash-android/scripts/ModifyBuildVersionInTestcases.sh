#!/bin/bash

buildVersion="$1"

buildVersion=${buildVersion//-/.}
# projectVersion=${buildVersion:0:3}
echo $buildVersion
# echo $projectVersion

# This is to get 'write' permissions on mac
# chflags nouchg /opt/auto-ng/calabash-android/Main/Project/features/gui.feature

sed -i 's/[0-9]\.[0-9]\ \[[0-9]\.[0-9]\.[0-9]\.[0-9]+/'"${buildVersion} [${buildVersion}"'/g' /opt/auto-ng/calabash-android/Main/Project/features/gui.feature

# sed -i 's/Then I should see id .* 01/Then I should see id "'$(date +%B)' 01/g' /opt/auto-ng/calabash-android/Main/Project/features/gui.feature
