Feature: Hotspot Finder

############################
#Hotspot Finder#
############################

@AUTO_TC_0HSF_INHS_GNRL_001 @HotspotFinder @HSF01 @reinstall
  Scenario: When the client is not connected, I validate message shown when a user taps the find hotspots option on the UI
    Then I disconnect from WiFi
    Then I launch OM
    Given I am on welcome screen
    Then I tap activate later
    Then I tap hotspot finder to see offline mode message
   	Then I assert all the elements on the offline hotspot message
    Then I take a screenshot

@AUTO_TC_0HSF_INHS_GNRL_002 @HotspotFinder @HSF02 @reinstall
  Scenario: I activate the client with generic profile id and verify the offline hotspot message
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I activate the client with generic profile id
    Then I disconnect from Wi-Fi
    Then I launch OM
    Then I tap hotspot finder to see offline mode message
   	Then I assert all the elements on the offline hotspot message
    Then I take a screenshot

@AUTO_TC_0HSF_INHS_GNRL_003 @HotspotFinder @HSF03 @reinstall
  Scenario: I activate the client with favourite profile id and verify the offline hotspot message
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I activate the client with favorite profile id
    Then I disconnect from Wi-Fi
    Then I launch OM
    Then I tap hotspot finder to see offline mode message
   	Then I assert all the elements on the offline hotspot message
    Then I take a screenshot

@AUTO_TC_0HSF_INHS_GNRL_004 @HotspotFinder @HSF04
  Scenario: I make a connection to Wi-Fi and navigate to hotspot finder page
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
   	Then I assert all elements on the hotspot finder page
    Then I take a screenshot

@AUTO_TC_0HSF_INHS_GNRL_010 @HotspotFinder @HSF10 @reinstall
  Scenario: I activate the client with no wifi directories and navigate to find hotspot to see if the client shows iPass networks
  	Then I connect to IAT-PSK
  	Then I launch OM
  	Given I am on welcome screen
  	Then I activate the client with no wifi profile id
  	Then I tap hotspot finder to see no hotspot date error
    Then I assert all elements on the no hotspot data page
  	Then I take a screenshot

#@AUTO_TC_0HSF_INHS_GNRL_012 - Revisit

#@AUTO_TC_0HSF_INHS_GNRL_013 -018 - Revisit

@AUTO_TC_0HSF_INHS_GNRL_019 @HotspotFinder @HSF19 @reinstall
  Scenario: I navigate to the hotspot finder view and scroll through the networks
  	Then I connect to IAT-PSK
  	Then I launch OM
  	Given I am on welcome screen
  	Then I activate the client with regular profile id
  	Then I tap hotspot finder to see hotspot finder page
  	Then I assert all elements on the hotspot finder page
  	Then I scroll through the networks on the hotspot finder page
  	Then I take a screenshot

@AUTO_TC_0HSF_INHS_GNRL_020 @HotspotFinder @HSF20
  Scenario: I validate the map button functionality on the hotspot finder page
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap the map button to see the map view
    Then I tap list button to see the hotspot finder page
    Then I see networks in the hotspot finder page
    Then I take a screenshot

#@AUTO_TC_0HSF_INHS_GNRL_021 @HotspotFinder @HSF21
 # Scenario: I validate the networks shown in the map and the network list
  #  Then I connect to IAT-PSK
  #  Then I launch OM
  #  Given I am on dashboard screen
  #  Then I tap hotspot finder to see hotspot finder page
  #  Then I see networks in the hotspot finder page
  #  Then I tap the map button to see the map view
    
  # Then I tap list button to see the hotspot finder page
  # Then I see networks in the hotspot finder page
  # Then I take a screenshot

#@AUTO_TC_0HSF_INHS_GNRL_022 @HotspotFinder @HSF22 - includes map verification

@AUTO_TC_0HSF_INHS_GNRL_023 @HotspotFinder @HSF23
  Scenario: I validate the search button on the hotspot finder page - search current location
  	Then I connect to IAT-PSK
  	Then I launch OM
  	Given I am on dashboard screen
  	Then I tap hotspot finder to see hotspot finder page
  	Then I tap the search field on hotspot finder page to see the filter view
  	Then I assert all elements on the search view on the hotspot finder page
  	Then I tap the search button on filter view
  	Then I see networks in the hotspot finder page
  	Then I compare the networks shown on the device with HSF db for location "RWS_Office"
  	Then I take a screenshot

@AUTO_TC_0HSF_INHS_GNRL_024 @HotspotFinder @HSF24
  Scenario: I validate the search button on the hotspot finder page - search a different location
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I tap the search field on hotspot finder page to see the filter view
    Then I assert all elements on the search view on the hotspot finder page
    Then I enter new york location in the search field and tap search
    Then I see networks in the hotspot finder page
    Then I compare the networks shown on the device with HSF db for location "JFK_Airport_NY"
    Then I take a screenshot

  #@AUTO_TC_0HSF_INHS_GNRL_025 @HotspotFinder @HSF25 - includes map verification

  #@AUTO_TC_0HSF_INHS_GNRL_026 @HotspotFinder @HSF26 - includes map verification

 @AUTO_TC_0HSF_INHS_GNRL_027 @HotspotFinder @HSF27
   Scenario: I search for the hotspots in the HSF page and tap on a one of the network to see other details related to the network
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I tap the search field on hotspot finder page to see the filter view
    Then I assert all elements on the search view on the hotspot finder page
    Then I tap the search button on filter view
    Then I see networks in the hotspot finder page
    Then I tap on the first hotspot displayed on the HSF page
    Then I assert all the elements on the hotspot details view
    Then I take a screenshot

#@AUTO_TC_0HSF_INHS_GNRL_028 @HotspotFinder @HSF28 - includes map verification

#@AUTO_TC_0HSF_INHS_GNRL_029 @HotspotFinder @HSF29 - includes map verification

#@AUTO_TC_0HSF_INHS_GNRL_030 @HotspotFinder @HSF30 - includes map verification

#@AUTO_TC_0HSF_INHS_GNRL_031 @HotspotFinder @HSF30 - includes map verification

#@AUTO_TC_0HSF_INHS_GNRL_032 @HotspotFinder @HSF32 - includes validating a hyperlink

#@AUTO_TC_0HSF_INHS_GNRL_033 @HotspotFinder @HSF33 - includes map verification

#@AUTO_TC_0HSF_INHS_GNRL_034 @HotspotFinder @HSF34 - Cannot validate options - Directions view

#@AUTO_TC_0HSF_INHS_GNRL_034 @HotspotFinder @HSF34 - Cannot validate options - Dial pad view

#@AUTO_TC_0HSF_INHS_GNRL_035 - 038 - Revisit

#@AUTO_TC_0HSF_INHS_GNRL_039 @HotspotFinder @HSF39
  #Scenario: I turn location services off and validate the message shown when tapped hotspot finder
    #Then I connect to IAT-PSK
    #Then I disable location services
    #Then I launch OM
    #Given I am on dashboard screen
    #Then I tap hotspot finder to see enable GPS message
    #Then I assert all elements on enable GPS page
    #Then I take a screenshot

#@AUTO_TC_0HSF_INHS_GNRL_040 - Cannot Automate

#@AUTO_TC_0HSF_INHS_GNRL_041 @HotspotFinder @HSF41
  #Scenario: I turn location services off and tap hotspot finder, I then tap the skip option to see GPS off view
    #Then I connect to IAT-PSK
    #Then I launch OM
    #Given I am on dashboard screen
    #Then I tap hotspot finder to see enable GPS message
    #Then I assert all elements on enable GPS page
    #Then I tap on skip option to see GPS off page
    #Then I assert all elements on the GPS skip page
    #Then I take a screenshot
    
#@AUTO_TC_0HSF_INHS_GNRL_042 @HotspotFinder @HSF42
  #Scenario: I turn location services off and tap hotspot finder, I then tap enable GPS option, enable GPS and navigate back to HSF to view the hotspots
    #Then I connect to IAT-PSK
    #Then I launch OM
    #Given I am on dashboard screen
    #Then I tap hotspot finder to see enable GPS message
    #Then I assert all elements on enable GPS page
    #Then I tap on enable GPS option and enable GPS
    #Then I launch OM
    #Then I see networks in the hotspot finder page
    #Then I take a screenshot
    
#@AUTO_TC_0HSF_INHS_GNRL_043 @HotspotFinder @HSF43 - Device Restart scenario, Revisit

@AUTO_TC_0HSF_INHS_GNRL_044 @HotspotFinder @HSF44
  Scenario: I search for an invalid geo location and verify the error message shown
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I tap the search field on hotspot finder page to see the filter view
    Then I search for an invalid geo location
    Then I assert all elements on the invalid geo location error message
    Then I take a screenshot

#@AUTO_TC_0HSF_INHS_GNRL_045 @HotspotFinder @HSF45 - Dup of 44

@AUTO_TC_0HSF_INHS_GNRL_046 @HotspotFinder @HSF46
  Scenario: I goto hotspot finder UI and tap the back button to see main dashboard
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I go back
    Then I have to see main dashboard
    Then I take a screenshot

@AUTO_TC_0HSF_INHS_GNRL_047 @HotspotFinder @HSF47
  Scenario: When in the hotspot finder view, I put the client in the background and bring it back to foreground to see the HSF page
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I put the client in the background and bring it back to foreground
    Then I see networks in the hotspot finder page
    Then I take a screenshot

#@AUTO_TC_0HSF_INHS_GNRL_048 - Mobiledata - Cannot Automate

#@AUTO_TC_0HSF_INHS_GNRL_049, 50 - Highly Impossible

@AUTO_TC_0HSF_INHS_GNRL_051 @HotspotFinder @HSF51
  Scenario: I search for hotspots for a location and during the search i disconnect from the network. I verify the message shown on the client
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap the nearby button on the hotspot finder page and disconnect from Wi-Fi to see no internet error
    Then I assert all the elements on the offline hotspot message
    Then I take a screenshot

#@AUTO_TC_0HSF_INHS_GNRL_052, 53 @HotspotFinder @HSF52 - Revisit

#@AUTO_TC_0HSF_INHS_GNRL_054 - Covered as Sanity02 TC

#@AUTO_TC_0HSF_INHS_GNRL_055, 56 - invalid

#@AUTO_TC_0HSF_INHS_GNRL_057, 58, 59, 60 - Invalid

#@AUTO_TC_0HSF_INHS_GNRL_061 @HotspotFinder @HSF61 - Revisit - Takes time to implement
 # Scenario: I download the offline hotspot data and then perform a search for the hotspot data with no internet connectivity
  #  Then I connect to IAT-PSK
   # Then I launch OM
    #Given I am on dashboard screen

#@AUTO_TC_0HSF_INHS_GNRL_063 @HotspotFinder @HSF63 - Covered in TC 10

@AUTO_TC_0HSF_INHS_GNRL_064 @HotspotFinder @HSF64
  Scenario: I verify the back button on the map view
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap the map button to see the map view
    Then I tap back button on the map view to see hotspot list
    Then I see networks in the hotspot finder page
    Then I take a screenshot

@AUTO_TC_0HSF_INHS_GNRL_065 @HotspotFinder @HSF65
  Scenario: I activate the client in default mode and tap the hotspot finder to see hotspots displayed based on current location
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I tap activate later
    Then I tap hotspot finder to see hotspot finder page
    Then I tap the search field on hotspot finder page to see the filter view
    Then I assert all elements on the search view on the hotspot finder page
    Then I tap the search button on filter view
    Then I see networks in the hotspot finder page
    Then I compare the networks shown on the device with HSF db for location "RWS_Office"
    Then I take a screenshot

#@AUTO_TC_0HSF_INHS_GNRL_066 - Switch profile - revisit

#@AUTO_TC_0HSF_INHS_GNRL_067 - Cannot Automate

#@AUTO_TC_0HSF_INHS_GNRL_068 - Cannot Automate

#@AUTO_TC_0HSF_INHS_GNRL_069 @HotspotFinder @HSF69 - Takes time to implement as its dependent on NetworksView class
 # Scenario: I connect to a network which doesn't have internet access, tap HSF and verify the message shown
  #  Then I disconnect from Wi-Fi
   # Then I launch OM
   # Given I am on dashboard screen
   # Then I tap networks section



#########################################
# Hotspot Finder - Report Feedback #
#########################################

@AUTO_TC_0HSF_INHS_GNRL_003 @HotspotFinder @HSF_RF03
  Scenario: I verify the hotspot data view to see if the report button is available
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I tap activate later
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap on the first hotspot displayed on the HSF page
    Then I assert all the elements on the hotspot details view
    Then I take a screenshot

@AUTO_TC_0HSF_HSFB_0GUI_004 @HotspotFinder @HSF_RF04
Scenario: I tap the report feedback button and verify the report hotspot view
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap on the first hotspot displayed on the HSF page
    Then I tap report hotspot view
    Then I assert all elements on the report hotspot view
    Then I take a screenshot

@AUTO_TC_0HSF_HSFB_0GUI_005 @HotspotFinder @HSF_RF05
Scenario: I verify if the report feedback buton is availale for an activated client
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I activate the client with regular profile id
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap on the first hotspot displayed on the HSF page
    Then I assert all the elements on the hotspot details view   
    Then I take a screenshot

@AUTO_TC_0HSF_HSFB_0GUI_006 @HotspotFinder @HSF_RF06
  Scenario: I verify if the report feedback buton is enabled by tapping the button and verifying the report feedback view
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap on the first hotspot displayed on the HSF page
    Then I tap report hotspot view
    Then I assert all elements on the report hotspot view
    Then I take a screenshot

#@AUTO_TC_0HSF_HSFB_0GUI_007 @HotspotFinder @HSF_RF07 - Revisit - Includes map

#@AUTO_TC_0HSF_HSFB_0GUI_008 - Automate later
  Scenario: I verify the hotspot feedback option for the offline mode

#@AUTO_TC_0HSF_HSFB_0GUI_009, @TC_0HSF_HSFB_0GUI_010 - TC04 covers this scenario

@AUTO_TC_0HSF_HSFB_0GUI_011 @HotspotFinder @HSF_RF011
  Scenario: I validate the checkbox's on the report feedback view
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap on the first hotspot displayed on the HSF page
    Then I tap report hotspot view
    Then I assert all elements on the report hotspot view
    Then I validate all the checkbox options available on the report hotspot view
    Then I take a screenshot

@AUTO_TC_0HSF_HSFB_0GUI_012 @HotspotFinder @HSF_RF012
  Scenario: I validate the other feedback option on the report feedback view
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap on the first hotspot displayed on the HSF page
    Then I tap report hotspot view
    Then I assert all elements on the report hotspot view
    Then I enter text into other feedback field on report hotspot view
    Then I validate the other feedback field for max chars
    Then I take a screenshot

@AUTO_TC_0HSF_HSFB_0GUI_013 @HotspotFinder @HSF_RF013
  Scenario: I validate the scrolling functionality in the other feedback text field
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap on the first hotspot displayed on the HSF page
    Then I tap report hotspot view
    Then I assert all elements on the report hotspot view
    Then I validate the other feedback field for max chars
    Then I scroll through the other feedback text field
    Then I take a screenshot

@AUTO_TC_0HSF_HSFB_0GUI_014 @HotspotFinder @HSF_RF014
  Scenario: I validate the submit button on the report feedback view
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap on the first hotspot displayed on the HSF page
    Then I tap report hotspot view
    Then I verify if the submit is enabled
    Then I select a checkbox and verify if the submit button is enabled
    Then I uncheck the checkbox and verify if the submit button is enabled
    Then I enter some text into other feedback field and verify if the submit button is enabled
    Then I take a screenshot

@AUTO_TC_0HSF_HSFB_0GUI_015 @HotspotFinder @HSF_RF015
  Scenario: I validate the submit button on the report feedback view with no data entered into the field
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap on the first hotspot displayed on the HSF page
    Then I tap report hotspot view
    Then I verify if the submit is enabled
    Then I enter text into other feedback field on report hotspot view
    Then I tap submit button and verify the feeback message
    Then I take a screenshot

#@AUTO_TC_0HSF_HSFB_0GUI_016, TC_0HSF_HSFB_0GUI_019 - Covererd in TC15

#@AUTO_TC_0HSF_HSFB_0GUI_017 - Logs - Cannot automate

@AUTO_TC_0HSF_HSFB_0GUI_021 @HotspotFinder @HSF_RF021
  Scenario: I enter text to the other feedback field and tap submit button, I then validate to see if the feeback message entered is updated on the server
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap on the first hotspot displayed on the HSF page
    Then I tap report hotspot view
    Then I verify if the submit is enabled
    Then I enter text into other feedback field on report hotspot view
    Then I tap submit button
    Then I wait for 30 seconds
    Then I verify if the message is uploaded to the report feedback server
    Then I take a screenshot 

#AUTO_TC_0HSF_HSFB_0GUI_023, 24 - Coverered in HSF_RF04

@AUTO_TC_0HSF_HSFB_0GUI_025 @HotspotFinder @HSF_RF025
  Scenario: I verify the report feedback functionality when there is no internet on the device
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap on the first hotspot displayed on the HSF page
    Then I tap report hotspot view
    Then I verify if the submit is enabled
    Then I enter text into other feedback field on report hotspot view
    Then I disconnect from Wi-Fi
    Then I launch OM
    Then I tap submit button
    #Then I tap submit button and verify the feeback message
    Then I wait for 3 seconds
    Then I connect to IAT-PSK
    Then I launch OM
    Then I wait for 45 seconds
    Then I verify if the message is uploaded to the report feedback server
    Then I take a screenshot

#AUTO_TC_0HSF_HSFB_0GUI_026 - TC25 covers this

#########################################
# Hotspot Finder - Offline Mode #
#########################################

@AUTO_TC_0HSF_OFHS_GNRL_001 @HotspotFinder @HSF_OM01
  Scenario: I navigate to hotspot finder page and tap the filter view. I then toggle the switch offline mode to ON and verify the message shown
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap filter button on the hotspot finder page
    Then I assert all elements on the filter view on the hotspot finder page
    Then I toggle offline mode switch on the filter view to see hotspot download message
    Then I assert all elements on the hotspot download message
    Then I take a screenshot

#AUTO_TC_0HSF_OFHS_GNRL_002 - HSF_OM01 - covers this

@AUTO_TC_0HSF_OFHS_GNRL_003 @HotspotFinder @HSF_OM03
  Scenario: I navigate to hotspot finder page and then to the map view. On the map view, I tap the filter view and verify the message shown when the switch offline mode is toggled to ON
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap the map button to see the map view
    Then I tap filter button on the map view
    Then I assert all elements on the filter view on the hotspot finder page
    Then I toggle offline mode switch on the filter view to see hotspot download message
    Then I assert all elements on the hotspot download message
    Then I take a screenshot

#@AUTO_TC_0HSF_OFHS_GNRL_004 @HotspotFinder @HSF_OM04 - Needs clarity

@AUTO_TC_0HSF_OFHS_GNRL_005 @HotspotFinder @HSF_OM05
  Scenario: I navigate to hotspot finder page and then toggle the offline mode to ON and download the offline hotspot data
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap the map button to see the map view
    Then I tap filter button on the map view
    Then I assert all elements on the filter view on the hotspot finder page
    Then I toggle offline mode switch on the filter view to see hotspot download message
    Then I tap download on the offline mode message to see download hotspot list view
    Then I tap download and wait till the hotspot data is downloaded
    Then I assert all elements after the hotspot data is downloaded
    Then I take a screenshot

@AUTO_TC_0HSF_OFHS_GNRL_006 @HotspotFinder @HSF_OM06
  Scenario: I download offline hotspot data, disconnect from all networks and then search for nearby hotspots
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I activate the client with regular profile id
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap the map button to see the map view
    Then I tap filter button on the map view
    Then I assert all elements on the filter view on the hotspot finder page
    Then I toggle offline mode switch on the filter view to see hotspot download message
    Then I tap download on the offline mode message to see download hotspot list view
    Then I tap download and wait till the hotspot data is downloaded
    Then I assert all elements after the hotspot data is downloaded
    Then I disconnect from Wi-Fi
    Then I launch OM
    Then I go back
    Then I go back
    Then I go back
    Then I have to see main dashboard
    Then I tap hotspot finder to see hotspot finder page 
    Then I see networks in the hotspot finder page
    Then I take a screenshot

#@AUTO_TC_0HSF_OFHS_GNRL_007 - Revisit

@AUTO_TC_0HSF_OFHS_GNRL_012 @HotspotFinder @HSF_OM12
  Scenario: I verify if the download message is 
    Then I connect to IAT-PSK
    Then I launch OM
    #Given I am on welcome screen
    #Then I activate the client with regular profile id
    #Then I tap hotspot finder to see hotspot finder page
    #Then I see networks in the hotspot finder page
    #Then I tap filter button on the hotspot finder page
    #Then I toggle offline mode switch on the filter view to see hotspot download message
    #Then I tap download on the offline mode message to see download hotspot list view
    #Then I tap download and wait till the hotspot data is downloaded
    Given I am on dashboard screen
    Then I tap option settings
    Then I tap download hotspot lists
    Then I assert all elements after the hotspot data is downloaded
    Then I tap update button on the download hotspot list page
    Then I verify if the buttons on the view are disabled
    Then I take a screenshot

@AUTO_TC_0HSF_OFHS_GNRL_013 @HotspotFinder @HSF_OM13
  Scenario: I verify the map view on the HSF page in offline mode
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I activate the client with regular profile id
    Then I tap hotspot finder to see hotspot finder page
    Then I see networks in the hotspot finder page
    Then I tap filter button on the hotspot finder page
    Then I toggle offline mode switch on the filter view to see hotspot download message
    Then I tap download on the offline mode message to see download hotspot list view
    Then I tap download and wait till the hotspot data is downloaded
    Then I assert all elements after the hotspot data is downloaded
    Then I go back
    Then I go back
    Then I go back
    Then I go back
    Then I have to see main dashboard
    Then I tap hotspot finder to see hotspot finder page 
    Then I see networks in the hotspot finder page
    Then I tap the map button to see map view in offline mode
    Then I assert all elements on the map view in offline mode
    Then I take a screenshot