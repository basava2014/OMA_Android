Feature: Connectivity

############################################################
#Connectivity:WiFi_Personal
############################################################

############################################################
#Connectivity:WiFi_GIS
############################################################


@TC_CONN_WIFI_PERS_003 @CONNECTIVITY @WiFi_Personal @WifiPers03 @reinstall
  Scenario: I initiate a connection to BL network and verify the cancel button behavior
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter regular profileid and tap ok
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap account
  Then I enter OM credentials
  Then I tap save to see option network UI
  Then I go back to see dashboard
  Then I launch OM
  Given I am on dashboard screen
  Then I tap the "iPassSOA" network
  Then I assert all elements on browser login page
  Then I tap cancel on browser login page
  Then I assert all elements in network access page when connected to browser based network
  Then I take a screenshot

###########################################
#TC-04,TC-17 covers here
# Does TC-18 to TC-22  also covered ????
###########################################  

 @TC_CONN_WIFI_PERS_004 @CONNECTIVITY @WiFi_Personal @WifiPers04
   Scenario: I initiate a connection to security based network 

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I clear account settings
  Then I tap option settings
  Then I tap account
  Then I enter OM credentials
  Then I tap save to see option network UI
  Then I go back to see dashboard
  Then I launch OM
  Given I am on dashboard screen
  Then I tap network "IAT-WEP" to connect after credentials are saved
  Then I assert all elements on the wifi security key view 
  Then I enter security key and tap ok
  Then I take a screenshot

##############################################
#TC-06,TC-07,TC-08,TC-09 covered here
##############################################

@AUTO_TC_CONN_WIFI_PERS_006 @CONNECTIVITY @TC_CON_PERS_06 @WifiPers06 @reinstall
 Scenario: I validate sequence after "A bad Password "is used to connect to the personal network with WEP/WPA1/WPA2 Security mode

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter regular profileid and tap ok
  Given I am on dashboard screen
  Then I tap "IAT-WEP" network
  Then I assert all elements on the complete registration message
  Then I tap ok on the complete registration message
  Then I enter OM credentials
  Then I tap save to see dashboard
  Then I assert all elements on the wifi security key view 
  Then I see the ok button disabled when the field left blank in networksecuritykey view
  Then I enter incorrect security key and tap ok
  Then I take a screenshot
  # I'm into f4 branch

@TC_CONN_WIFI_PERS_011 @CONNECTIVITY @WiFi_Personal @WifiPers11
  Scenario: I long press on a security based network and verify the options "Edit/clear Wi-Fi password"

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I long press "IAT-WEP" network
  Then I assert all elements on editclearwifipassword view
  Then I take a screenshot

@TC_CONN_WIFI_PERS_020 @CONNECTIVITY @WiFi_Personal @WifiPers20
  Scenario: I disconnect an existing connection from the native client and verify the same on the client

  Then I connect to IAT-PSK
  Then I launch OM
  Then I disconnect from WiFi
  Given I am on dashboard screen
  Then I clear password for network "IAT-PSK"
  Then I tap "IAT-PSK" network to connect
  Then I assert all elements on the wifi security key view 
  Then I enter security key and tap ok
  Given I am on dashboard screen
  Then I disconnect from WiFi
  Then I assert the elements when wifi enabled but not connected in dashboardnetworkpanel
  Then I take a screenshot

##################################
# WIFI-GENERAL #
################################## 
  @TC_CONN_WIFI_GNRL_001 @CONNECTIVITY @WiFi_General @WifiGen01 @reinstall
  Scenario: I validate to disconnect from a Wi-Fi network

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter regular profileid and tap ok
  Given I am on dashboard screen
  Then I tap "IAT-GIS" network
  Then I assert all elements on the complete registration message
  Then I tap ok on the complete registration message
  Then I enter OM credentials
  Then I tap save to see dashboard
  Given I am on dashboard screen
  Then I tap disconnect on network access view
  Then I take a screenshot

@TC_CONN_WIFI_GNRL_006 @CONNECTIVITY @WiFi_General @WifiGen06
  Scenario: I verify if the OM client will connect to a network when the password is not saved
  
  Then I connect to IAT-PSK
  Then I launch OM
  Then I clear account settings
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap account
  Then I enter OM credentials
  Then I tap save to see option network UI
  Then I go back to see dashboard
  Then I launch OM
  Then I tap network "IAT-GIS" to connect after credentials are saved
  Given I am on dashboard screen
  Then I assert elements on the connected network
  Then I take a screenshot

#######################################################
#TC-09,TC-10,TC-11 covered here
#######################################################

@AUTO_TC_CONN_WIFI_GNRL_009 @CONNECTIVITY @TC_GUI_GENRL_09 @reinstall
 Scenario: I verify the behavior when connecting to the Wi-Fi networks on navigating through the notification message

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter regular profileid and tap ok
  Given I am on dashboard screen
  Then I tap "IAT-GIS" network
  Then I assert all elements on the complete registration message
  Then I tap ok on the complete registration message
  Then I enter OM credentials
  Then I tap save to see dashboard
  Given I am on dashboard screen
  Then I disconnect from WiFi
  Then I assert the elements when wifi enabled but not connected in dashboardnetworkpanel
  Then I take a screenshot

@TC_CONN_WIFI_GNRL_015 @CONNECTIVITY @WiFi_General @WifiGen015
  Scenario: I verify connection behavior when only domain is entered with no prefix value

  Then I connect to IAT-PSK
  Then I launch OM
  Then I clear account settings
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap account
  Then I enter android "username"
  Then I enter android "password"
  Then I enter android "domain"
  Then I tap save to see option network UI
  Then I go back to see dashboard
  Then I launch OM
  Given I am on dashboard screen
  Then I tap network "IAT-GIS" to connect after credentials are saved
  Given I am on dashboard screen
  Then I assert elements on the connected network
  Then I take a screenshot

@TC_CONN_WIFI_GNRL_016 @CONNECTIVITY @WiFi_General @WifiGen016
  Scenario: I verify connection behavior when only valid domain or valid prefix value or both is provided

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I clear account settings
  Then I tap option settings
  Then I tap account
  Then I enter android "prefix"
  Then I enter android "username"
  Then I enter android "password"
  Then I enter android "domain" 
  Then I tap save to see option network UI
  Then I go back to see dashboard
  Then I launch OM
  Given I am on dashboard screen
  Then I tap network "IAT-GIS" to connect after credentials are saved
  Given I am on dashboard screen
  Then I assert elements on the connected network
  Then I take a screenshot

@TC_CONN_WIFI_GNRL_022 @CONNECTIVITY @WiFi_General @WifiGen022
  Scenario: I verify connection behavior for an ipass network, when no value is entered for domain and prefix fields

  Then I connect to IAT-PSK
  Then I launch OM 
  Given I am on dashboard screen
  Then I clear account settings
  Then I tap option settings
  Then I tap account
  Then I enter android "username" 
  Then I enter android "password"
  Then I tap save to see option network UI
  Then I go back to see dashboard
  Then I launch OM
  Given I am on dashboard screen
  Then I tap network "IAT-COLUBRIS" from network list
  Then I assert all elements on the account view
  Then I take a screenshot
##################################
# WIFI-INHERITED #
##################################

@TC_CONN_WIFI_INHE_001 @CONNECTIVITY @WiFi_Inherited @WifiInh001 @reinstall
  Scenario: I verify client behavior for an inherited connection 

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter regular profileid and tap ok
  Given I am on dashboard screen
  Then I see "IAT-PSK" on the connection status and top of the networks section
  Then I take a screenshot

##################################
# WIFI-GIS #
################################## 

@TC_CONN_WIFI_0GIS_001 @CONNECTIVITY @WiFi_Gis @WifiGis001 @reinstall
  Scenario: I make a connection to a GIS network after activating the client
  
 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on welcome screen
 Then I assert all elements on welcome screen
 Then I navigate to activation code UI
 Then I enter regular profileid and tap ok
 Given I am on dashboard screen
 Then I tap "IAT-GIS" network
 Then I assert all elements on the complete registration message
 Then I tap ok on the complete registration message
 Then I enter OM credentials
 Then I tap save to see dashboard
 Given I am on dashboard screen
 Then I assert elements on the connected network
 Then I take a screenshot

@AUTO_TC_CONN_WIFI_0GIS_005 @CONNECTIVITY @TC_CON_0GIS_05 @reinstall
 Scenario: I validate OM Connection is not disconnected after moving away from the networklist screen during connection Progress
  
  Then I connect to IAT-PSK
  Then I launch OM
  Then I clear account settings
  Given I am on dashboard screen
  Then I tap "IAT-GIS" network
  Then I assert all elements on the complete registration message
  Then I tap ok on the complete registration message
  Then I enter OM credentials
  Then I tap save to see dashboard
  Given I am on dashboard screen
  Then I go to home
  Then I launch OM
  Given I am on dashboard screen
  Then I assert elements on the connected network
  Then I take a screenshot

@TC_CONN_WIFI_0GIS_010 @CONNECTIVITY @WiFi_Gis @WifiGis010
  Scenario: I add an "@" character in the username field and validate the client behavior

 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on dashboard screen
 Then I clear account settings
 Then I tap option settings
 Then I tap account
 Then I assert all elements on the account view
 Then I enter username "sdas@" in account settings view
 Then I assert all elements in warning message view
 Then I tap ok button on warning message view
 Then I tap save to see option network UI
 Then I take a screenshot

