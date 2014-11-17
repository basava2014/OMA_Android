#!/usr/bin/env ruby
$test_server_path = ''
$om_apk_path = '/opt/auto-ng/calabash-android/Main/Project/OpenMobileAndroidClient.apk'
$wfm_apk_path = '/opt/auto-ng/calabash-android/Main/Project-WFM/WiFiMobilize.apk'

$om_client = 'OpenMobileAndroidClient.apk'
$om_client_abs_path = '/opt/auto-ng/calabash-android/Main/Project/' + $om_client

$wfm_client = 'WiFiMobilize.apk'
$wfm_client_abs_path = '/opt/auto-ng/calabash-android/Main/Project-WFM/' + $wfm_client

testComponent = ARGV[0]

if testComponent.include?"WFM_"
	Dir.chdir('/opt/auto-ng/calabash-android/Main/Project-WFM')
else
	Dir.chdir('/opt/auto-ng/calabash-android/Main/Project')
end
############
#
# Uninstall apks from device first 

isOMInstalled = `adb shell pm list package com.iPass.OpenMobile`.strip
puts "isOMInstalled --> #{isOMInstalled}"

isWFMInstalled = `adb shell pm list de.telekom.wifimobilize`.strip
puts "isWFMInstalled --> #{isWFMInstalled}"

if !isOMInstalled.include?"Error"
	puts "Uninstalling OM and Test Server apps"
	begin
		system("adb uninstall com.iPass.OpenMobile")
	rescue Exception => e
		@error_msg = "#{$!}"
		puts "There was an issue with uninstalling "
	end

	system("adb uninstall com.iPass.OpenMobile.test")
	puts "Deleting old test servers apks from server"
	begin
		Dir.glob('/opt/auto-ng/calabash-android/Main/Project/test_servers/*.apk'){|apk_to_del| File.delete(apk_to_del)}
	rescue Exception => e
		@error_msg = "#{$!}"
		puts "There was an issue with deleteing the test servers: " + error_msg
	end
end

if !isWFMInstalled.include?"Error"
	puts "Uninstalling WFM and Test Server apps"
	begin
		system("adb uninstall de.telekom.wifimobilize")
	rescue Exception => e
		@error_msg = "#{$!}"
		puts "There was an issue with uninstalling "
	end

	system("adb uninstall de.telekom.wifimobilize.test")
	puts "Deleting old test servers apks from server"
	begin
		Dir.glob('/opt/auto-ng/calabash-android/Main/Project-WFM/test_servers/*.apk'){|apk_to_del| File.delete(apk_to_del)}
	rescue Exception => e
		@error_msg = "#{$!}"
		puts "There was an issue with deleteing the test servers: " + error_msg
	end
end

############
=begin
puts "Uninstalling OM and Test Server apps"
begin
	system("adb uninstall com.iPass.OpenMobile")
rescue Exception => e
	@error_msg = "#{$!}"
	puts "There was an issue with uninstalling "
end

system("adb uninstall com.iPass.OpenMobile.test")
puts "Deleting old test servers apks from server"
begin
	Dir.glob('/opt/auto-ng/calabash-android/Main/Project/test_servers/*.apk'){|apk_to_del| File.delete(apk_to_del)}
rescue Exception => e
	@error_msg = "#{$!}"
	puts "There was an issue with deleteing the test servers: " + error_msg
end
############
=end
#
# Begin Installation of Test Server and Apk
puts 'Beginning install process ...'

if !testComponent.include?"WFM_"
	puts 'Calabash is now resigning OM!'
	system("calabash-android resign " + "#{$om_client_abs_path}")
	sleep 1
	puts 'Calabash is now building the test server! '
	system("calabash-android build " + "#{$om_client_abs_path}")
else
	puts 'Calabash is now resigning WFM!'
	system("calabash-android resign " + "#{$wfm_client_abs_path}")
	sleep 1
	puts 'Calabash is now building the test server! '
	system("calabash-android build " + "#{$wfm_client_abs_path}")
end

=begin
system("calabash-android resign " + "#{$om_client_abs_path}")
system("calabash-android resign " + "#{$wfm_client_abs_path}")
sleep 1
puts 'Calabash is now building the test server! '
system("calabash-android build " + "#{$om_client_abs_path}")
system("calabash-android build " + "#{$wfm_client_abs_path}")
sleep 1
puts 'Installing the apps!'
=end
#############
#Will find an apk file in the current directory and return its abs_path
#$om_apk_path = '/opt/auto-ng/calabash-android/Main/Project/OpenMobileAndroidClient.apk'

Dir.glob('/opt/auto-ng/calabash-android/Main/Project/test_servers/*.apk') do |test_apk|
	$test_server_path = test_apk
end
#puts $test_server_path
#puts $om_apk_path

############
# Installing commands probably should remove apk's from the phone too 
system("adb install -r " + "#{$om_apk_path}")
sleep 1
system("adb install -r " + "#{$test_server_path}")

###########
#
# Remove and Reinstall Wifi-Connect
# There seems to be issues with calabash if you background the app and return to it
# during a run of a feature. For now this line of code is to connect the device to the
# local WPA network we've specified in this case IAT-PSK

puts "Connecting to Wifi..."
`adb uninstall com.wificonnect`
`adb install -r /opt/auto-ng/calabash-android/Main/Project/wifiConnect.apk`
`adb shell am start -n com.wifiConnect/.WifiConnect`
`adb shell input keyevent 3`
puts "Connected!"
