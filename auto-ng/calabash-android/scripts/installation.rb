#!/usr/bin/env ruby
test_server_path = ''
#$om_apk_path = '/opt/auto-ng/calabash-android/Main/Project/OpenMobileAndroidClient.apk'

om_client = 'OpenMobileAndroidClient.apk'
wfm_client = 'WiFiMobilize.apk'

project_dir = '/opt/auto-ng/calabash-android/Main/Project'
om_project_dir = '/opt/auto-ng/calabash-android/Main/Project'
wfm_project_dir = '/opt/auto-ng/calabash-android/Main/Project-WFM'

om_apk_path = "#{om_project_dir}/#{om_client}"
wfm_apk_path = "#{wfm_project_dir}/#{wfm_client}"

testComponent = ARGV[0]
proj = ARGV[1]

puts "Test Component --> #{testComponent}"
puts "Product --> #{proj}"
#$om_client_abs_path = '/opt/auto-ng/calabash-android/Main/Project/' + $om_client
Dir.chdir("#{om_project_dir}")
client_apk = om_apk_path

if testComponent.include?"WFM"
	puts "Found WFM component - #{testComponent}"
	Dir.chdir("#{wfm_project_dir}")
	client_apk = wfm_apk_path
	project_dir = '/opt/auto-ng/calabash-android/Main/Project-WFM'
elsif proj === "WFM"
	puts "Found WFM project"
	Dir.chdir("#{wfm_project_dir}")
	client_apk = wfm_apk_path
	project_dir = '/opt/auto-ng/calabash-android/Main/Project-WFM'
end

############
# Uninstall apks from device first 
############

isOMInstalled = `adb shell pm list package com.iPass.OpenMobile`.strip
puts "isOMInstalled --> #{isOMInstalled}"

isWFMInstalled = `adb shell pm list package de.telekom.wifimobilize`.strip
puts "isWFMInstalled --> #{isWFMInstalled}"

if !isOMInstalled.empty?
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

if !isWFMInstalled.empty?
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
# Begin Installation of Test Server and Apk
############

puts 'Beginning install process ...'
puts "client_apk path --> #{client_apk}"
puts "Calabash is now resigning client!"
system("calabash-android resign " + "#{client_apk}")
sleep 1
puts 'Calabash is now building the test server! '
system("calabash-android build " + "#{client_apk}")
sleep 1
puts 'Installing the apps!'

#############
#Will find an apk file in the current directory and return its abs_path
#$om_apk_path = '/opt/auto-ng/calabash-android/Main/Project/OpenMobileAndroidClient.apk'

Dir.glob("#{project_dir}/test_servers/*.apk") do |test_apk|
	test_server_path = test_apk
end
#puts $test_server_path
#puts $om_apk_path

############
# Installing commands probably should remove apk's from the phone too 
system("adb install -r " + "#{client_apk}")
sleep 1
system("adb install -r " + "#{test_server_path}")

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
`adb shell input keyevent 3`
`adb shell input keyevent 3`

puts "Connected!"
