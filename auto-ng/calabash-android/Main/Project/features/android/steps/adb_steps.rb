
##Relative file path to apps directory
$appsPath = File.join(File.dirname(__FILE__), '../../../apps')

Then(/^I screenshot$/) do
	#pic = scenario.source_tag_names[0]
	screenshot({:prefix => "../reports/"})
end

Then(/^I launch OM$/) do
  `adb shell am start -n com.iPass.OpenMobile/.Ui.StartActivity`
  step('I wait for 3 seconds')
end

Then(/^I disconnect from (?:WiFi|Wi-Fi)/) do
  `adb install -r #{$appsPath}/wifiRemove.apk`
  `adb shell am start -n com.wifiRemove/.WifiRemove`
  `adb shell input keyevent 4`
  step 'I launch OM'
end

Then(/^I connect to IAT\-PSK$/) do
  #Done in order to insure that wifi connect launches successfully everytime and connects
  `adb install -r #{$appsPath}/wifiConnect.apk`
  `adb shell am start -n com.wifiConnect/.WifiConnect`
  sleep 3
  # input keyevent 3 is pressing the home button for some reason on some device older ones we get recent apps
  # multiple presses causes it to return to the main homepage of android
  `adb shell input keyevent 3`
  `adb shell input keyevent 3`
  `adb shell input keyevent 3`
  step 'I launch OM'
end

Then(/^I connect to IAT\-WEP$/) do
  `adb install -r #{$appsPath}/IAT-WEP.apk`
  `adb shell am start -n com.iat_wep/.MainActivity`
  sleep 2
end

Then(/^I connect to IPASSSOA$/) do
  `adb install -r #{$appsPath}/iPassSOA.apk`
  `adb shell am start -n com.ipasssoa/.MainActivity`
  sleep 2
end

Then(/^I go to home$/) do
  # input keyevent 3 is pressing the home button for some reason on some device older ones we get recent apps
  # multiple presses causes it to return to the main homepage of android
  `adb shell input keyevent 3`
  `adb shell input keyevent 3`
  `adb shell input keyevent 3`
end

Then(/^I enable location services$/) do
  #res = `adb shell getprop sys.settings_secure_version`.delete('\r\n').to_i
  #puts "secure_version enable value --> #{res}"
  `adb shell am start -a android.settings.LOCATION_SOURCE_SETTINGS`
  `adb shell input keyevent 23`
  `adb shell input keyevent 19`
  `adb shell input keyevent 23`
  sleep 1
  `adb shell input keyevent 22`
  `adb shell input keyevent 23`
  `adb shell input keyevent 4`
  `adb shell input keyevent 4`
end

Then(/^I disable location services$/) do
  #res = `adb shell getprop sys.settings_secure_version`.delete('\r\n').to_i
  #puts "secure_version disable value --> #{res}"
  `adb shell am start -a android.settings.LOCATION_SOURCE_SETTINGS`
  `adb shell input keyevent 23`
  sleep 1
  `adb shell input keyevent 4`
  `adb shell input keyevent 4`
end

Then(/^I enable location services when the view is already opened$/) do
  `adb shell input keyevent 23`
  `adb shell input keyevent 19`
  `adb shell input keyevent 23`
  sleep 1
  `adb shell input keyevent 22`
  `adb shell input keyevent 23`
  `adb shell input keyevent 4`
end

Then(/^I put the client in the background and bring it back to foreground$/) do
  `adb shell am start -a android.settings.LOCATION_SOURCE_SETTINGS`
  sleep 3
  `adb shell input keyevent 4`
end

Then(/^I enable Wi\-Fi$/) do
  `adb install -r #{$appsPath}/Wifi_Enable.apk`
  `adb shell am start -n com.wifi_enable/.MainActivity`
  sleep 2
end

Then(/^I disable Wi\-Fi$/) do
  `adb install -r #{$appsPath}/Wifi_Disable.apk`
  `adb shell am start -n com.wifi_disable/.MainActivity`
  sleep 2
end

Then(/^I go to sleep$/) do
  `adb shell input keyevent 26`
end

Then(/^I wake up$/) do
  `adb shell input keyevent 26`
end

Then(/^I turn on airplane mode$/) do
  `adb shell am start -a android.settings.AIRPLANE_MODE_SETTINGS`
  `adb shell input keyevent KEYCODE_ENTER`
  `adb shell input keyevent 4`
end

Then(/^I turn off airplane mode$/) do
  `adb shell am start -a android.settings.AIRPLANE_MODE_SETTINGS`
  `adb shell input keyevent KEYCODE_ENTER`
  `adb shell input keyevent 4`
end

Then(/^I scroll_up$/) do
  performAction('drag',1,1,75,65,1)
end
 
Then(/^I scroll_down$/) do
  performAction('drag',1,75,1,65,1)
end

Then(/^I verify if the app is launched$/) do
  cmd = "adb shell dumpsys activity | grep com.iPass.OpenMobile | grep .Ui"
  res = system(cmd)
  if res
    raise "Client is launched, some activity found running - #{`#{cmd}`}}"
  end
end

Then(/^I swipe down to see notifications$/) do
  step 'I go to home'
  `adb shell input swipe 10 10 1000 1000`
  sleep 2
end

Then(/^I swipe up to close notifications view$/) do
  step 'I go home'
  `adb shell input swipe 1000 1000 10 10`
  sleep 2
end

Then(/^I tap client notification from notifications view$/) do
  step 'I swipe down to see notifications'
  ActivationBySilentProvisionDefns.TapClientNotification
end

Then(/^I kill the client process$/) do
  `adb shell am force-stop com.iPass.OpenMobile`
  start_test_server_in_background
end


