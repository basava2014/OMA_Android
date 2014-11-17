#########################
# Other variables
#########################
$qa_email="omc.android@gmail.com"
$qa_wrongemail="@gmail.com"
#########################


#########################
# Profile ID Definitions#
#########################
$regular_profile_id="23266" #Sanity Profile, configured with default account settings and prefix enabled. Also add IAT-GIS network dir.
							#Also configure PPR with IAT-GIS network as prefer network and iRoam as Prohibit network
$pin_profile_id="23267"		##Pin Proifle - Also configure PPR with IAT-PSK network as prefer network and IAT-PROXY as Prohibit network
$test_profile_id="17131"
$update_profile_id="17130"
$domain_spinner_profile_id="17128"
$no_save_pwd_profile_id="17129"
$no_netw_profile_id="17127"
$branded_profile_id="17132"
$test_pin_profile_id="17342"
$incorrect_directory_profile_id="17977"
$prefix_with_slash_profile_id="17978"
$prefix_without_slash_profile_id="17979"
$predefined_key_profile_id="17980"
$netw_without_key_profile_id="17981"
$netw_with_wrong_key_profile_id="17982"
$ttls_profile_id="17985"
$ttls_force_connect_profile_id="17986"
$ttls_update_profile_id="17987"
$ttls_no_save_pwd_profile_id="17988"
$peap_profile_id="17989"
$peap_force_connect_profile_id="17990"
$peap_update_profile_id="17991"
$peap_no_save_pwd_profile_id="17992"
$migrate_profile_id_2_2="17930"
$migrate_profile_id_2_3="17931"
$migrate_profile_id_2_4="17932"
$migrate_profile_id_2_5="17933"
$bundle_profile_id_2_2="17934"
$bundle_profile_id_2_3="17935"
$bundle_profile_id_2_4="17936"
$bundle_profile_id_2_5="17937"

$noWifi_profile_id="23268"
$noPin_profile_id="22066"
$wrong_profile_id="00000"
$empty_profile_id=""
$fav_profile_id="23269" #  (21496) This needs change everytime as export profile isn't supported
$nofav_profile_id = ""
$generic_profile_id = "23284"
$ios_fav_profile_id = "10656"
$windows_fav_profile_id = "21289"

##############
#Profile PINS#
##############
$profile_pin="0x2A"
$test_profile_pin=""
$wrong_profile_pin="01234AAAAA"
$ios_windows_profile_pin = "3mconnect"


class ProfileIDs
	@@fav_profile_id = "23124"
	@@generic_profile_id = "17575"

	def self.queryString(str)
		if ProfileIDs.class_variable_defined?"@@#{str}"

			return ProfileIDs.class_variable_get"@@#{str}"
		end
	end
	
end


################# Notes ##################

#Favourite Profile - Configuration include, Account with prefix enabled and value set to "IPASS/"
#                    profile be PIN enabled and added with all the Wi-Fi networks 
