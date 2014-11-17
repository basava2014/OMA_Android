Feature: Sanity

@AUTO_TC_ACTV_PRFL_CODE_002 @sanity01
  Scenario: During sanity, as a tester I check to see if I can activate OM
	Then I connect to IAT-PSK
	Then I launch OM
	Then I assert and tap accept
	Given I am on welcome screen
	Then I assert all elements on welcome screen
	Then I navigate to activation code UI
    Then I enter regular profileid and tap ok
    Then I assert all elements on dashboard page
    Then I take a screenshot

@AUTO_TC_0GUI_STGS_ABUT_001 @sanity02
  Scenario: During sanity, check GUI for correct text
  	Given I am on dashboard screen
  	Then I assert all elements on dashboard page
  	Then I tap option settings
  	Then I assert all elements on option settings view
  	Then I tap about
  	Then I assert all elements on about page
  	Then I validate the build no on the app
  	Then I take a screenshot

@AUTO_TC_CONN_WIFI_0GIS_001 @sanity03
  Scenario: During sanity, Login as a user
  	Given I am on dashboard screen
  	Then I tap option settings
  	Then I tap account
  	Then I enter OM credentials
  	#Then I tap save to see dashboard
  	Then I tap save to see option network UI
  	#Then I tap option settings
  	Then I tap account
  	Then I verify if the credentials are saved
  	Then I take a screenshot

@AUTO_TC_CONN_WIFI_0GIS_001 @sanity04
  Scenario: During sanity, as a tester I want to verify that the client connects to a GIS network and that the proper UI elements appear
    Then I disconnect from WiFi
	Then I launch OM
	Given I am on dashboard screen
	Then I clear account settings
	Then I tap "IAT-GIS" network
	Then I assert all elements on the complete registration message
	Then I tap ok on the complete registration message
	Then I assert all elements on the account view
	Then I enter OM credentials
	Then I tap save to see dashboard
	Then I assert elements on the connected network
	Then I take a screenshot

@AUTO_TC_CONN_WIFI_CUST_001 @sanity05
  Scenario:During sanity, as a tester I want to verify that the client allows connections to custom networks that require a WPA key and to verify UI elements during the test 
  	Then I disconnect from WiFi
	Then I launch OM
	Given I am on dashboard screen
	Then I clear account settings
	Then I tap "IAT-PSK" network
	Then I assert all elements on the complete registration message
	Then I tap ok on the complete registration message
	Then I assert all elements on the account view
	Then I enter OM credentials
	Then I tap save to see wifi security view
	Then I enter security key and tap ok
	Then I assert elements on the connected non ipass network
	Then I take a screenshot
