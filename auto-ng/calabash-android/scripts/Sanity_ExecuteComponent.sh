#!/bin/bash
# by Almas
# Modified by Devin 4/9/13
# Modified by Miguel 05/07/13

# Global parameters 

component=$1
reportsFileName=$2
device=`cat /mnt/ngc-adrdata/adr/prod/Platforms/Handheld/$reportsFileName.running | grep "Device" | cut -d ':' -f2 | tr -d '\r'`
projectNumber=$(echo $2 | cut -d "_" -f3)
buildNumber=`cat /mnt/ngc-adrdata/adr/prod/Platforms/Handheld/$reportsFileName.running | grep "BuildNumber" | cut -d '=' -f2 | tr -d '\r'`
osver=`adb shell getprop ro.build.version.release`
testlang=`cat /mnt/ngc-adrdata/adr/prod/Platforms/Handheld/$reportsFileName.running | grep "TestLanguage" | cut -d '=' -f2 | tr -d '\r'`
deviceManuf=`adb shell 'getprop ro.product.manufacturer | tr -d "\n"'`
deviceModel=`adb shell 'getprop ro.product.model | tr -d "\n"'`
deviceName="${deviceManuf} ${deviceModel}"
testLanguage=`cat /mnt/ngc-adrdata/adr/prod/Platforms/Handheld/$reportsFileName.running | grep "TestLanguage" | grep -o "=.*(" | sed 's/[(,=)]//g'`
product=`cat /mnt/ngc-adrdata/adr/prod/Platforms/Handheld/$reportsFileName.running | grep "Product" | cut -d '=' -f2 | tr -d '\r'`

echo "Component: $component"


function DownloadBuildAndLocalization {
	echo "Downloading the build and localization"
	#buildNumber=`cat /mnt/ngc-adrdata/adr/prod/Platforms/Handheld/$reportsFileName.running | grep "BuildNumber" | cut -d '=' -f2 | tr -d '\r'`
	echo "$projectNumber"
	echo "$buildNumber"
	echo "$device"
	echo "$product"
	eval "/opt/auto-ng/calabash-android/scripts/CopyBuildAndLocalizationFiles.sh $projectNumber $buildNumber $component $product";
}

function InstallFreshOM {
	echo "Handeled by Calabash"
	#`ssh -p 6222 root@localhost rm -rf /User/Applications/*`	m
	#`ssh -p 6222 root@localhost launchctl stop com.apple.SpringBoard`
	#sleep 10
	#eval "/opt/auto-ng/calabash-android/scripts/RunFruitstrap.sh"
}

function SetLanguage {
	echo "Set language NOT IMPLEMENTED"
#	testLanguage=`cat /mnt/ngc-adrdata/adr/prod/Platforms/Handheld/$reportsFileName.running | grep TestLanguage | grep -o "(.*)" | sed 's/[(,)]//g'`
#	echo $testLanguage
#	`ssh -p 6222 root@localhost cp /automationFiles/deviceLanguages/$testLanguage/.GlobalPreferences.plist /private/var/mobile/Library/Preferences/`
#	`ssh -p 6222 root@localhost launchctl stop com.apple.SpringBoard`
#	sleep 10
}

function UpdateLogFile {

	 # Print all report information to the text file
        echo -e "Test results for component: $component">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.log";
        echo -e "Passed: $1, Failed:$2, Total:$3">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.log";
        echo -e "">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.log";

}
 
 function AddDeviceInfoToLogFile {

        echo -e "Device Information:">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.log";
        echo -e "----------------------------">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.log";
        echo -e "">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.log";
        echo -e "Device Model      - $deviceName">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.log";
        echo -e "OS                         - $osver">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.log";
        echo -e "Test Language   - $testlang">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.log";

}

function SendEmailReport {
  # Add the link to full report to log file
#######################################
# UPDATE SANITY TEST RESULTS - Added by Mahesh
#######################################

echo "Getting sanity results from $reportsFileName"
#total=`cat /opt/auto-ng/calabash-android/Main/Project/result.txt | grep -o ":total=>..." | cut -d'"' -f2`
#pass=`cat /opt/auto-ng/calabash-android/Main/Project/result.txt | grep -o ":pass=>..." | cut -d'"' -f2`
#fail=`cat /opt/auto-ng/calabash-android/Main/Project/result.txt | grep -o ":fail=>..." | cut -d'"' -f2`
fail=`cat /mnt/ngc-adrdata/adr/prod/Platforms/Handheld/$reportsFileName.running | grep "TestAreaResult" | cut -d '#' -f4 | cut -d ':' -f1 | cut -d '-' -f1 | tr -d '\r'`
pass=`cat /mnt/ngc-adrdata/adr/prod/Platforms/Handheld/$reportsFileName.running | grep "TestAreaResult" | cut -d '#' -f4 | cut -d ':' -f1 | cut -d '-' -f2 | tr -d '\r' | tr -d ' '`
total=`cat /mnt/ngc-adrdata/adr/prod/Platforms/Handheld/$reportsFileName.running | grep "TestAreaResult" | cut -d '#' -f4 | cut -d ':' -f1 | cut -d '-' -f3 | tr -d '\r' | tr -d ' '`
echo "Total --> $total"
echo "Pass --> $pass"
echo "Fail --> $fail"


if [ $pass == $total ] && [ $pass != 0 ]
		then
		echo "Sanity test PASSEDDDDD"
		sanityResult="PASSED"
	else
		echo "Sanity test FAILEDDDDDD"
		sanityResult="FAILED"
	fi

######################################

  echo -e "\nYou can download full report here:">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.log";
  echo -e "http://10.10.230.55:8080/adr/prod/Platforms/Handheld/OMA/$projectNumber/Captures/$reportsFileName.zip">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.log";

  echo "copying to reports dir!"
  # Copy the log file to adr
  cp "/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.log" "/mnt/ngc-adrdata/adr/prod/Platforms/Handheld/OMA/$projectNumber/Reports/."
  
  # Create email file with contents of report file
  #echo -e "mail -s \"*** Android Sanity Test Result  $buildNumber, Device: $device\"  mdiaz@ipass.com -- -f Automation_Report@ipass.com </adrdata/adr/prod/Platforms/Handheld/OMA/$projectNumber/Reports/$reportsFileName.log ***">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.mail";
#  echo -e "mail -s \"*** Android Sanity Test Result  $buildNumber, Device: $device\"  qualityassurance-automation@ipass.com,engineering-build-release@ipass.com,auto_reports_handhelds@ipass.com,mdiaz@ipass.com -- -f Automation_Report@ipass.com </adrdata/adr/prod/Platforms/Handheld/OMA/$projectNumber/Reports/$reportsFileName.log ***">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.mail";
  echo -e "mail -s \"*** Android Sanity Test: $sanityResult for build $buildNumber\"  mhadimani@ipass.com -- -f Automation_Report@ipass.com </adrdata/adr/prod/Platforms/Handheld/OMA/$projectNumber/Reports/$reportsFileName.log ***">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.mail";
  # echo -e "mail -s \"*** Android Sanity Test: $sanityResult for build $buildNumber\"  engineering-build-release@ipass.com,auto_reports_handhelds@ipass.com -- -f Automation_Report@ipass.com </adrdata/adr/prod/Platforms/Handheld/OMA/$projectNumber/Reports/$reportsFileName.log ***">>"/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.mail";


  #qualityassurance-automation@ipass.com,engineering-build-release@ipass.com,auto_reports_handhelds@ipass.com,vdinicola@ipass.com,mdiaz@ipass.com
  # Copy email file to adr mailbox
  echo "Copy email file to adr mailbox"
  cp "/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.mail" "/mnt/ngc-adrdata/mailbox/."

  # Remove log and mail file from test machine
  rm "/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.log"
  rm "/opt/auto-ng/calabash-android/Main/Project/$reportsFileName.mail"
  rm "/opt/auto-ng/calabash-android/Main/Project/sanityResult.txt"  #-Added by Mahesh

}


#SetLanguage
#DownloadBuildAndLocalization
#InstallFreshOM

# RUN SETUP AGAIN IF THE COMPONENT is WFM #
###################################################

if [[ "$component" == WFM* ]]
then
	echo "Found component = $component"
	DownloadBuildAndLocalization
fi

###################################################

###################################################
###################################################
# PREPARE THE LIST OF TESTCASES FOR THE COMPONENT #
###################################################
if [ "$component" == "Setup" ];
then
	#SetLanguage
	DownloadBuildAndLocalization
	#InstallFreshOM
	iniFile=/mnt/ngc-adrdata/adr/prod/Platforms/Handheld/"$reportsFileName"."running"
	stringToReplace=$(cat $iniFile | grep "TestAreaResult" | sed "s/$component:/$component#0 - 1 - 1#pass:/g")
	sed -i "s/^TestAreaResult.*/$stringToReplace/g" $iniFile
	#sed -E -i '' "s/^TestAreaResult.*/$stringToReplace/g" $iniFile
	exit 0;
elif [ "$component" == "Sanity" ];
then
	testcases='features/sanity.feature --tag @sanity01';
	echo "Sanity Test"
	
elif [ "$component" == "GUI" ];
then
	#testcases=`--names TC_A_ACTIVATE_001`
	#testcases=`cat /opt/auto-ng/calabash-android/Main/Project/features/gui.feature | grep "Scenario" | awk '/ */ {print $2}' |  sed 's/^/ --name "/g' | sed 's/$/" /g' | tr '\n' ' ' `
	testcases='features/gui.feature';
elif [ "$component" == "Connectivity" ];
then
	testcases=`cat /opt/auto-ng/calabash-android/Main/Project/features/connectivity.feature | grep "Scenario" | awk '/ */ {print $2}' |  sed 's/^/ --name "/g' | sed 's/$/" /g' | tr '\n' ' ' `
elif [ "$component" == "AccountSettings" ];
then
	testcases=`cat /opt/auto-ng/calabash-android/Main/Project/features/accountsettings.feature | grep "Scenario" | awk '/ */ {print $2}' |  sed 's/^/ --name "/g' | sed 's/$/" /g' | tr '\n' ' ' `


elif [ "$component" == "Activation" ];
then
	testcases='features/activation.feature --tag @ActivationWizard';
	echo "Activation Test"

elif [ "$component" == "WFM_Sanity" ];
then
	testcases='features/sanity_WFM.feature --tag @sanity01';
	echo "WFM Sanity Test"


elif [ "$component" == "AccountSettings" ];
then
	testcases=`cat /opt/auto-ng/calabash-android/Main/Project/features/accountsettings.feature | grep "Scenario" | awk '/ */ {print $2}' |  sed 's/^/ --name "/g' | sed 's/$/" /g' | tr '\n' ' ' `
elif [ "$component" == "Cleanup" ];
then
	########################################################
	# ZIP ALL RESULTS TOGETHER, UPLOAD TO ADR, AND CLEANUP #
	########################################################
	cd /opt/auto-ng/calabash-android/Main/Project/
	AddDeviceInfoToLogFile
	zip "$reportsFileName"."zip" *.zip*
	cp "$reportsFileName"."zip" /mnt/ngc-adrdata/adr/prod/Platforms/Handheld/OMA/$projectNumber/Captures
	rm *.zip*
	SendEmailReport
	rm result.txt
	exit 0;
else
	# EXIT IF COMPONENT IS INVALID 
	echo "Invalid component!"
	exit 1;
fi


if [ "$2" == "" ];
then
	# EXIT IF INI FILE NAME IS MISSING
	echo "Missing the ini file name"
	exit 1;
fi


echo "testcases --> $testcases"

######################
# RUN CALABASH       #
######################
echo "STARTING TEST"

if [ "$testcases" != "" ]
then
	if  [ "$product" == "WFM" ]
	then
		echo "Found product=$product, Changing directory path"
		cd /opt/auto-ng/calabash-android/Main/Project-WFM/
		pwd
		eval "calabash-android run WiFiMobilize.apk $testcases -f json -o /opt/auto-ng/calabash-android/Main/Project/cucumber.json -f html -o /opt/auto-ng/calabash-android/Main/Project/cucumber.html"
		cp *screenshot* /opt/auto-ng/calabash-android/Main/Project
	elif [[ "$component" == WFM* ]]
	then
		echo "Found component=$component, Changing directory path"
		cd /opt/auto-ng/calabash-android/Main/Project-WFM/
		pwd
		eval "calabash-android run WiFiMobilize.apk $testcases -f json -o /opt/auto-ng/calabash-android/Main/Project/cucumber.json -f html -o /opt/auto-ng/calabash-android/Main/Project/cucumber.html"
		cp *screenshot* /opt/auto-ng/calabash-android/Main/Project
	else
		echo "Setting default path"
		cd /opt/auto-ng/calabash-android/Main/Project/
		pwd
		eval "calabash-android run OpenMobileAndroidClient.apk $testcases -f json -o ./cucumber.json -f html -o /opt/auto-ng/calabash-android/Main/Project/cucumber.html"
	fi
fi


#Extract result from JSON#
ruby -r "/opt/auto-ng/calabash-android/scripts/reports.rb" -e "getExecutionStats" >> /opt/auto-ng/calabash-android/Main/Project/result.txt

###########################################
# PARSE HTML FILE AND GET RESULTS NUMBERS #
###########################################

#total=$(cat results.html | grep -o "[0-9]* scenario.*<br" | grep -o "[0-9]* scenario" | grep "[0-9]*" | grep -o "[0-9]*")
#pass=$(cat results.html | grep -o "[0-9]* scenario.*<br" | grep -o "[0-9]* passed" | grep "[0-9]*" | grep -o "[0-9]*")
#fail=$(cat results.html | grep -o "[0-9]* scenario.*<br" | grep -o "[0-9]* failed" | grep "[0-9]*" | grep -o "[0-9]*")

total=`cat /opt/auto-ng/calabash-android/Main/Project/result.txt | grep -o ":total=>..." | cut -d'"' -f2`
pass=`cat /opt/auto-ng/calabash-android/Main/Project/result.txt | grep -o ":pass=>..." | cut -d'"' -f2`
fail=`cat /opt/auto-ng/calabash-android/Main/Project/result.txt | grep -o ":fail=>..." | cut -d'"' -f2`

if ! [ -n "$pass" ];
then
  pass=0
fi
if ! [ -n "$fail" ];
then
  fail=0
fi
if ! [ -n "$total" ];
then
  total=0
fi
echo "Total: $total, pass:$pass, fail:$fail"

#######################################
##Added by Mahesh
 echo "Writing sanity results to sanityResult file"
 echo -e "total=$total">>"/opt/auto-ng/calabash-android/Main/Project/sanityResult.txt";
 echo -e "pass=$pass">>"/opt/auto-ng/calabash-android/Main/Project/sanityResult.txt";
 echo -e "fail=$fail">>"/opt/auto-ng/calabash-android/Main/Project/sanityResult.txt";
#######################################

#######################################
# UPDATE THE ADR.INI FILE ON ADRSTORE #
#######################################

iniFile=/mnt/ngc-adrdata/adr/prod/Platforms/Handheld/"$reportsFileName"."running"

stringToReplace=$(cat $iniFile | grep "TestAreaResult" | sed "s/\b$component:\b/$component#$fail - $pass - $total:/g")
echo $stringToReplace

sed -i "s/^TestAreaResult.*/$stringToReplace/g" $iniFile

###################
# UPDATE LOG FILE #
###################
UpdateLogFile $pass $fail $total

#######################
#Added by Mahesh
echo -e "adrFileName=$reportsFileName">>"/opt/auto-ng/calabash-android/Main/Project/ReportData.txt";
echo -e "projectNumber=$projectNumber">>"/opt/auto-ng/calabash-android/Main/Project/ReportData.txt";
echo -e "buildNumber=$buildNumber">>"/opt/auto-ng/calabash-android/Main/Project/ReportData.txt";
echo -e "testLanguage=$testLanguage">>"/opt/auto-ng/calabash-android/Main/Project/ReportData.txt";
echo "testLanguage:$testLanguage"
echo -e "device=$device">>"/opt/auto-ng/calabash-android/Main/Project/ReportData.txt";
#########################

#####################
# Update Reports DB #
#####################

ruby -r "/opt/auto-ng/calabash-android/scripts/reports.rb" -e "invokeMethod"

###################################################
# ZIP CURRENT COMPONENT REPORT FILES AND CLEAN UP #
###################################################
cd /opt/auto-ng/calabash-android/Main/Project # change directory for WFM projects

echo "ziping reports"
zip "$component"."zip" *screenshot* cucumber.json cucumber.html ReportData.txt
rm *screenshot*
rm cucumber.html #Added by Mahesh
rm cucumber.json #Added by Mahesh
rm ReportData.txt #Added by Mahesh
rm result.txt #Added by Mahesh

##############################
# UPLOAD RESULTS TO ADRSTORE #
##############################
cp "$reportsFileName"."zip" /mnt/ngc-adrdata/adr/prod/Platforms/Handheld/OMA/$projectNumber/Reports

###########################################
# REMOVE RESULT ARCHIVE FROM THIS MACHINE #
###########################################
rm "$reportsFileName"."zip" 
