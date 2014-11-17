Feature: GUI

#######################################
  #DataUsage Panel
#######################################
 @AUTO_TC_0GUI_DABO_DUSG_001 @DATAUSAGEPANEL @TS_GUI_001 @TS_0GUI_DUSP_001 @reinstall
  Scenario: I validate the data usage panel on Dashboard
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter regular profileid and tap ok
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I take a screenshot

 @AUTO_TC_0GUI_DABO_DUSG_002 @DATAUSAGEPANEL @TS_GUI_002 @TS_0GUI_DUSP_002
  Scenario: Then I validate the data usage panel at first launch (Without setting the usage limit)

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I see the default data limit on data usage panel page after first launch
  Then I take a screenshot

 @AUTO_TC_0GUI_DABO_DUSG_004 @DATAUSAGEPANEL @TS_GUI_004 @TS_0GUI_DUSP_004
  Scenario:  I validate the Data Usage Panel(setting the data usage limit)

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I set the data limit value "5.0" in usage settings view
  Then I verify the data limit in data usage panel
  Then I take a screenshot

  ###########################################
  #Settings: DataUsage Settings
  ###########################################
  @AUTO_TC_0GUI_STGS_USTG_001 @USAGESETTINGS @TS_0GUI_DTUS_01 @reinstall
  Scenario:I validate the usage settings at first launch of OMC
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter regular profileid and tap ok
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I take a screenshot

  @AUTO_TC_0GUI_STGS_USTG_002 @USAGESETTINGS @TS_0GUI_DTUS_02
  Scenario: I validate the behavior in the UI when the Alert is disabled

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I should see the checkbox unchecked on set limit ui
  Then I should see calender picker button enabled in usage settings view
  Then I should see monthly limit button enabled
  Then I should see save button enabled
  Then I should see cancel button enabled
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_USTG_003 @USAGESETTINGS @TS_0GUI_DTUS_03
  Scenario: I validate the behavior in the UI when the alert is enabled

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I enabled the checkbox in usagesettings UI
  Then I should see calender picker button enabled in usage settings view
  Then I should see monthly limit button enabled
  Then I should see save button enabled
  Then I should see cancel button enabled
  Then I take a screenshot
 
@AUTO_TC_0GUI_STGS_USTG_004 @USAGESETTINGS @TS_0GUI_DTUS_04
 Scenario: I validate that "My billing cycle begins on" is a calender containing 28 Day's

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I tap calender picker
  Then I validate the calender picker exists in usagesettings UI
  Then I take a screenshot
 ##########################################################
 #TC-05 and TC-15 and TC-17,TC-25 covered here
 ##########################################################
 @AUTO_TC_0GUI_STGS_USTG_005 @USAGESETTINGS @TS_0GUI_DTUS_05 
 Scenario: I validate that the "My billing cycle begins on" is by default set to "1" in the UI

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I see the default date in usage settings view
  Then I see the default data limit in usage settings view
  Then I tap save button in usage settings view
  Then I assert all elements in usage meter view
  Then I validate the billing period for a month on usagesetting panel
  Then I take a screenshot
 #################################
 #TC-06 and TC-16 covered here
 #################################

@AUTO_TC_0GUI_STGS_USTG_006 @USAGESETTINGS @TS_0GUI_DTUS_06
 Scenario: I validate that the "My billing begins on" can take any values between 1-28 from the calender picker

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I set the value "2" on calander picker
  Then I tap save button in usage settings view
  Then I validate the billing period after setting a date for a month in usagesetting panel
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_USTG_008 @USAGESETTINGS @TS_0GUI_DTUS_08
 Scenario: I validate for the maximum value that "My monthly limit is" can take(Maximum 3 digit)

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I set the data limit value "555" in usage settings view
  Then I take a screenshot

##########################################
#TC-09 and TC-18,TC-22, TC-23 covered here
##########################################

@AUTO_TC_0GUI_STGS_USTG_009 @USAGESETTINGS @TS_0GUI_DTUS_09
  Scenario: I validate when large value are provided to "My monthly limit is" (More than 3 digit)

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I set the data limit value "9999" in usage settings view
  Then I verify the data limit in data usage panel
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_USTG_010 @USAGESETTINGS @TS_0GUI_DTUS_10
  Scenario: I validate the slider of "My monthly limit is" is exists in Usagesettings UI
  
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I validate the slider exists in usagesettings UI
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_USTG_011 @USAGESETTINGS @TS_0GUI_DTUS_11
 Scenario: I validate that the "Save" button is enabled when the Alert is disabled

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I should see the checkbox unchecked on set limit UI
  Then I should see save button enabled
  Then I take a screenshot

 @AUTO_TC_0GUI_STGS_USTG_012 @USAGESETTINGS @TS_0GUI_DTUS_12
   Scenario: I validate that the "Save" and "Cancel" button are Enabled when the Alert is Enabled

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I enabled the checkbox in usagesettings UI
  Then I should see save button enabled
  Then I should see cancel button enabled
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_USTG_013 @USAGESETTINGS @TS_0GUI_DTUS_13
  Scenario: I validate the "Usage Settings" page will close down when hit on the "Cancel" with Alert enabled/disabled

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I tap cancel button in usage settings view
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_USTG_014 @USAGESETTINGS @TS_0GUI_DTUS_14
 Scenario: I validate the details are accepted on the UsageSettings page when hit on the "Save" button and to check the 
  details further by re-navigating to "UsageSettings" page by Enabling the checkbox

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I enabled the checkbox in usagesettings UI
  Then I tap cancel button in usage settings view
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I take a screenshot

  @AUTO_TC_0GUI_STGS_USTG_021 @USAGESETTINGS @TS_0GUI_DTUS_21
   Scenario: I validate the "My monthly limit is" in Usage Settings UI by left it Blank

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I set monthly data limit empty and check the behavior in data usage panel
  Then I take a screenshot


 @AUTO_TC_0GUI_STGS_USTG_024 @USAGESETTINGS @TS_0GUI_DTUS_24
  Scenario: I validate that the OMC should not allow to set the usage limit as "0" MB/GB

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I tap set limit
  Then I assert all elements in usage settings view
  Then I set 0 to monthly limit in usage settings view
  Then I tap save button in usage settings view
  Then I assert all elements in data limit message view
  Then I take a screenshot

  #########################################################
  #Settings:AccountSettings
  #########################################################

@AUTO_0GUI_STGS_001 @Account @GUI_ACT01 @TS_GUI_ACNT_01 @reinstall 
 Scenario: As a user, I validate the options available under account settings option
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter regular profileid and tap ok
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap account
  Then I assert all elements on the account view
  Then I take a screenshot

#@AUTO_0GUI_STGS_002 @Account @GUI_ACT02 @TS_GUI_ACNT_02
  Scenario: I validate the Cancel option on account settings view

  #Given I am on dashboard screen
  #Then I tap option settings
  #Then I tap account
  #Then I assert all elements on the account view
  #Then I tap cancel button on account settings view
  #Then I have to see main dashboard
  #Then I take a screenshot
@AUTO_0GUI_STGS_003 @Account @GUI_ACT03 @TS_GUI_ACNT_03
 Scenario: I validate the save option on the account settings view 

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap account
  Then I assert all elements on the account view
  Then I tap save to see option network UI
  Then I take a screenshot 

  @AUTO_0GUI_STGS_005 @Account @GUI_ACT05 @TS_GUI_ACNT_05
   Scenario: I validate the client behavior by entering 32 chars of data into each of the field

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap account
  Then I assert all elements on the account view
  Then I enter 32 characters into account settings fields
  Then I tap save to see option network UI
  Then I take a screenshot
 ####################################
 #TC-12 and TC-16 covered here
 ####################################

  @AUTO_0GUI_STGS_012 @Account @GUI_ACT12 @TS_GUI_ACNT_12
    Scenario: I validate Behavior when "@" symbol is entered in the username field

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap account
  Then I assert all elements on the account view
  Then I enter username "sdas@" in account settings view
  Then I assert all elements in warning message view
  Then I tap ok button on warning message view
  Then I tap save to see option network UI
  Then I take a screenshot

  @AUTO_0GUI_STGS_013 @Account @GUI_ACT13 @TS_GUI_ACNT_13
   Scenario: I validate that only one warning message is displayed for multiple "@" entries
  
   Given I am on dashboard screen
   Then I tap option settings
   Then I tap account
   Then I assert all elements on the account view
   Then I enter username "sdas@" in account settings view
   Then I assert all elements in warning message view
   Then I tap ok button on warning message view
   Then I enter text "das@" into field with id "EditTextID"
   #Then I enter "das@" into username field
   Then I tap save to see option network UI
   Then I take a screenshot


 @AUTO_0GUI_STGS_014 @Account @GUI_ACT14 @TS_GUI_ACNT_14
   Scenario:  I Validate the behavior when editing the username field with/without "@" after re-navigating to the UI

   Given I am on dashboard screen
   Then I tap option settings
   Then I tap account
   Then I assert all elements on the account view
   Then I enter username "sdas@" in account settings view
   Then I assert all elements in warning message view
   Then I tap ok button on warning message view
   Then I tap save to see option network UI
   Then I go back
   Then I launch OM
   Given I am on dashboard screen
   Then I tap option settings
   Then I tap account
   Then I assert all elements on the account view
   Then I enter text "sad@" into field with id "EditTextID"
   Then I assert all elements in warning message view
   Then I tap ok button on warning message view
   Then I tap save to see option network UI
   Then I take a screenshot
   ################################################
   #TC-15 and TC-17 covered here
   ################################################

   @AUTO_0GUI_STGS_015 @Account @GUI_ACT15 @TS_GUI_ACNT_15
    Scenario: I validate the behavoir when any other fields(Beside Username) are edited with "@" Symbol
   
   Then I connect to IAT-PSK
   Then I launch OM
   Given I am on dashboard screen
   Then I tap option settings
   Then I tap account
   Then I assert all elements on the account view
   Then I enter username "sdas@" in account settings view
   Then I assert all elements in warning message view
   Then I tap ok button on warning message view
   Then I enter android "password" in account settings view
   Then I assert all elements on the account view
   Then I enter android "domain" in account settings view
   Then I tap save to see option network UI
   Then I go back
   Then I launch OM
   Given I am on dashboard screen
   Then I tap "IAT-COLUBRIS" network from the networklist and check authentication
   Then I assert all elements on authentication problem page
   Then I take a screenshot

   ############################################
   #ABOUT TC's
   ############################################

@AUTO_TC_0GUI_STGS_ABUT_001 @About @GUI_ABT01 @TC_0GUI_ABT_01 @reinstall
   Scenario: As a user, I validate the options available under the about option
   
   Then I connect to IAT-PSK
   Then I launch OM
   Given I am on welcome screen
   Then I assert all elements on welcome screen
   Then I navigate to activation code UI
   Then I enter regular profileid and tap ok
   Given I am on dashboard screen
   Then I tap option settings
   Then I tap about
   Then I assert all elements on about page
   Then I take a screenshot

@AUTO_TC_0GUI_STGS_ABUT_007 @About @GUI_ABT07 @TC_0GUI_ABT_07  
   Scenario: I validate the message shown when update netwoks is selected and when the server reponds with "No Updates"
   
   Then I connect to IAT-PSK
   Then I launch OM
   Given I am on dashboard screen
   Then I tap option settings
   Then I tap about
   Then I assert all elements on about page
   Then I tap update networks on about page
   Then I assert all elements in update networks view
   Then I take a screenshot

@AUTO_TC_0GUI_STGS_ABUT_008 @About @GUI_ABT08 @TC_0GUI_ABT_08  
 Scenario: I validate the OK button shown on the "No updates" message
   
   Then I connect to IAT-PSK
   Then I launch OM
   Given I am on dashboard screen
   Then I tap option settings
   Then I tap about
   Then I assert all elements on about page
   Then I tap update networks on about page
   Then I tap ok on update networks view to see about page
   Then I take a screenshot

@AUTO_TC_0GUI_STGS_ABUT_009 @About @GUI_ABT09 @TC_0GUI_ABT_09
  Scenario: I validate the message shown, when the client is not connected to the internet and when the option "Update Networks" is selected

  Then I disconnect from WiFi
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap about
  Then I assert all elements on about page
  Then I tap no update network view
  Then I assert all elements in no update networks view
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_ABUT_010 @About @GUI_ABT10 @TC_0GUI_ABT_10
 Scenario: I validate the Ok button shown on the "No Internet connectivity" message
  
  Then I disconnect from WiFi
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap about
  Then I assert all elements on about page
  Then I tap no update network view
  Then I assert all elements in no update networks view
  Then I tap ok on no update networks view to see about page
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_ABUT_012 @About @GUI_ABT12 @TC_0GUI_ABT_12 
    Scenario: I verify the scrolling behavior on the client by navigating to different pages 
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap speed test
  Then I assert all elements in speed test start view
  Then I tap start on speed test start view
  Then I go back
  Then I have to see main dashboard
  Then I tap option settings
  Then I tap account 
  Then I tap save to see option network UI
  Then I go back
  Then I launch OM
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_ABUT_013 @About @GUI_ABT13 @TC_0GUI_ABT_13 @reinstall
  Scenario: I activate the client in default mode and then verify the "Replace Profile" option under "About"
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I activate the app in default mode
  Then I tap option settings
  Then I tap about
  Then I should not see replace profile option on about page
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_ABUT_014 @About @GUI_ABT14 @TC_0GUI_ABT_14 @reinstall
 Scenario: I activate the client with a valid profile and then verify the "Replace Profile" option
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I assert all the elements on activationcode page
  Then I enter regular profileid and tap ok
  Then I tap option settings
  Then I tap about
  Then I should see replace profile option exists on about page
  Then I take a screenshot


@AUTO_TC_0GUI_STGS_ABUT_015 @About @GUI_ABT15 @TC_0GUI_ABT_15
  Scenario: I verify the "Replace Profile" option and the warning info message and the OMC behavior on clicking on the button

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap about
  Then I assert all elements on about page
  Then I tap replace profile on about page
  Then I assert all elements on replace profile page
  Then I tap ok on replace profile view to see activationcode page
  Then I assert all the elements on activationcode page
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_ABUT_016 @About @GUI_ABT16 @TC_0GUI_ABT_16
 Scenario: I verify the "Replace Profile" option and validate if the new profile is applied
 
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap about
  Then I assert all elements on about page
  Then I tap replace profile on about page
  Then I assert all elements on replace profile page
  Then I tap ok on replace profile view to see activationcode page
  Then I assert all the elements on activationcode page
  Then I enter pin profile id
  Then I enter pin for pin profile id
  Then I enter an email address
  Then I tap ok button on activationcode page 
  Then I tap option settings
  Then I tap about
  Then I assert all elements on about page
  Then I verify profile id with "pin_profile_id"
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_ABUT_018 @About @GUI_ABT18 @TC_0GUI_ABT_18
 Scenario: I verify the "Replace Profile" option with an invalid profile id
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap about
  Then I assert all elements on about page
  Then I tap replace profile on about page
  Then I assert all elements on replace profile page
  Then I tap ok on replace profile view to see activationcode page
  Then I assert all the elements on activationcode page
  Then I enter wrong profile id
  Then I enter an email address
  Then I tap ok button on activationcode page to see wrong activationcode error message
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_ABUT_020 @About @GUI_ABT20 @TC_0GUI_ABT_20
 Scenario: I verify the cancel button on the activation page while replacing a profile

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap about
  Then I assert all elements on about page
  Then I tap replace profile on about page
  Then I assert all elements on replace profile page
  Then I tap ok on replace profile view to see activationcode page
  Then I assert all the elements on activationcode page
  Then I tap cancel button on activationcode page to see about view
  Then I take a screenshot


###################################
#Speed Test Dashboard
###################################

##########################################################################
#Below TC to be updated in Manual sheet by Manual Team as the UI changed
###########################################################################

@AUTO_TC_0GUI_DBRD_SPTS_002 @SpeedTest @GUI_SPTS_02 @TC_0GUI_SPDT_02 @reinstall
 Scenario: I validate the speed test behavior when an internet connection is not available

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter regular profileid and tap ok
  Then I disconnect from WiFi
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap speed test
  Then I assert all elements in speed test with no connection page
  Then I take a screenshot
  
#@AUTO_TC_0GUI_DBRD_SPTS_003 @SpeedTest @GUI_SPTS_03 @TC_0GUI_SPDT_03------------->Invalid TC

@AUTO_TC_0GUI_DBRD_SPTS_004 @SpeedTest @GUI_SPTS_04 @TC_0GUI_SPDT_04
 Scenario: I validate the speed test behavior when an internet connection is available
 
 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on dashboard screen
 Then I tap option settings
 Then I tap speed test
 Then I assert all elements in speed test start view
 Then I take a screenshot

@AUTO_TC_0GUI_DBRD_SPTS_005 @SpeedTest @GUI_SPTS_05 @TC_0GUI_SPDT_05
 Scenario: I validate the cancel button after tapping the speed test section

 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on dashboard screen
 Then I tap option settings
 Then I tap speed test
 Then I assert all elements in speed test start view
 Then I tap cancel on speed test start view
 Then I take a screenshot

@AUTO_TC_0GUI_DBRD_SPTS_006 @SpeedTest @GUI_SPTS_06 @TC_0GUI_SPDT_06
 Scenario: I validate the start button after tapping the speed test section

 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on dashboard screen
 Then I tap option settings
 Then I tap speed test
 Then I assert all elements in speed test start view
 Then I tap start on speed test start view
 Then I assert all elements in speed test result view
 Then I take a screenshot

@AUTO_TC_0GUI_DBRD_SPTS_007 @SpeedTest @GUI_SPTS_07 @TC_0GUI_SPDT_07
 Scenario: I tap back option during a speed test to see the OM main dashboard
 
 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on dashboard screen
 Then I tap option settings
 Then I tap speed test
 Then I assert all elements in speed test start view
 Then I tap start on speed test start view
 Then I assert all elements in speed test result view
 Then I go back
 Then I have to see main dashboard
 Then I take a screenshot

 ##################################################
 #WelComePage_General
 ##################################################

###################################
#TC-01 and TC-07 both covered here
###################################

@AUTO_TC_0GUI_WPGE_GNRL_001 @WelcomePage @GUI_WP01 @TC_0GUI_WEl01 @reinstall
  Scenario: As a user, I launch the client after an install and validate the UI elements
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I see the application name in the welcome page
  Then I take a screenshot

#@AUTO_TC_0GUI_WPGE_GNRL_002 @WelcomePage @GUI_WP02 ------>Invalid TC(Settings Menu available no more now)

@AUTO_TC_0GUI_WPGE_GNRL_003 @WelcomePage @GUI_WP03 @TC_0GUI_WEl03
  Scenario: I tap the "Activate Code" button and validate the UI

  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I assert all the elements on activationcode page
  Then I take a screenshot

@AUTO_TC_0GUI_WPGE_GNRL_004 @WelcomePage @GUI_WP04 @TC_0GUI_WEl04
  Scenario: I tap the activate later option and validate the message
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I tap activate later and assert all elements in the UI  
  Then I take a screenshot 

@AUTO_TC_0GUI_WPGE_GNRL_005 @WelcomePage @GUI_WP05 @TC_0GUI_WEl05
  Scenario: I tap the activate later option, validate the message and tap the back option  
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I tap activate later and assert all elements in the UI 
  Then I go back
  Then I assert all elements on the activation later message
  Then I take a screenshot

@AUTO_TC_0GUI_WPGE_GNRL_006 @WelcomePage @GUI_WP06 @TC_0GUI_WEl06
  Scenario: After an installation, I validate the activate later option
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen  
  Then I tap activate later and assert all elements in the UI 
  Then I take a screenshot

##########################################
#TC_DefaultMode_General
##########################################

#################################
#TC-3 and TC-7 covered here
#################################

@AUTO_TC_0GUI_DMOD_GNRL_001 @Def_General @GUI_GE01 @TC_0GUI_DMGN01 @reinstall
  Scenario: I verify the "Welcome" screen in the default mode
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen 
  Then I take a screenshot

@AUTO_TC_0GUI_DMOD_GNRL_002 @Def_General @GUI_GE02 @TC_0GUI_DMGN02 
 Scenario: I verify the "Activate Later" option in the "Welcome" screen
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen 
  Then I activate the app in default mode
  Then I take a screenshot  

@AUTO_TC_0GUI_DMOD_GNRL_003 @Def_General @GUI_GE03 @TC_0GUI_DMGN03
  Scenario: I validate the options avilable under the settings button on the main UI when client activated in default mode
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap activate
  Given I am on welcome screen
  Then I assert all elements on welcome screen  
  Then I activate the app in default mode
  Given I am on dashboard screen
  Then I tap option settings
  Then I assert all elements on option settings view when client is not activated
  Then I take a screenshot

@AUTO_TC_0GUI_DMOD_GNRL_004 @Def_General @GUI_GE04 @TC_0GUI_DMGN04 
  Scenario: I navigate to settings option on the main UI and validate the options available under "About"  
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap activate
  Given I am on welcome screen
  Then I assert all elements on welcome screen  
  Then I activate the app in default mode
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap about
  Then I assert all elements on about page when client activated defaultmode
  Then I take a screenshot

@AUTO_TC_0GUI_DMOD_GNRL_005 @Def_General @GUI_GE05 @TC_0GUI_DMGN05 
  Scenario: I navigate to settings option on the main UI and navigate to "About" UI and validate data under "More Info" UI
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap activate
  Given I am on welcome screen
  Then I assert all elements on welcome screen  
  Then I activate the app in default mode
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap about
  Then I tap more info on about page
  Then I assert all elements in more info page
  Then I take a screenshot

  @AUTO_TC_0GUI_DMOD_GNRL_015 @Def_General @GUI_GE15 @TC_0GUI_DMGN15 
 Scenario: I activate the client in default mode and then verify the "Replace Profile" option
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap activate
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I activate the app in default mode
  Given I am on dashboard screen
  Then I tap option settings
  Then I assert all elements on option settings view when client is not activated
  Then I tap about
  Then I should not see replace profile option on about page
  Then I take a screenshot
  
@AUTO_TC_0GUI_DMOD_GNRL_008 @Def_General @GUI_GE08 @TC_0GUI_DMGN08 @reinstall
  Scenario: I activate the client in default mode and then navigate to the activation code UI via the menu options
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen  
  Then I activate the app in default mode
  Then I tap option settings
  Then I assert all elements on option settings view when client is not activated
  Then I tap activate
  Then I navigate to activation code UI
  Then I assert all the elements on activationcode page
  Then I take a screenshot

@AUTO_TC_0GUI_DMOD_GNRL_009 @Def_General @GUI_GE09 @TC_0GUI_DMGN09 @reinstall
  Scenario: I activate the client in default mode and then navigate to the activation code UI via the menu options and then I tap the cancel option to see If the user is navigated back to the welcome page

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen  
  Then I activate the app in default mode
  Then I tap option settings
  Then I assert all elements on option settings view when client is not activated
  Then I tap activate
  Then I assert all elements on welcome screen 
  Then I navigate to activation code UI
  Then I assert all the elements on activationcode page
  Then I tap cancel button on activationcode page
  Then I take a screenshot

@AUTO_TC_0GUI_DMOD_GNRL_012 @Def_General @GUI_GE12 @TC_0GUI_DMGN12 @reinstall
  Scenario: After an installation, I activate the client in default mode and then activate the client through a pin/profile id
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I activate the app in default mode
  Then I tap option settings
  Then I assert all elements on option settings view when client is not activated
  Then I tap activate
  Then I navigate to activation code UI
  Then I assert all the elements on activationcode page
  Then I enter pin profile id
  Then I enter pin for pin profile id
  Then I enter an email address
  Then I tap ok button on activationcode page to see travel preference view 
  Then I tap lets start on travel preference view
  Then I take a screenshot



############################################
#Service Overview(Take a Tour)#
############################################ 

@AUTO_TC_0GUI_STGS_TOUR_001 @TakeTour @GUI_TOUR_001 @TC_0GUI_TKATR01 @reinstall
  Scenario: I verify the take a tour option under the settings menu after a client installation
 
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter regular profileid and tap ok
  Then I tap option settings
  Then I tap help
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_TOUR_004 @TakeTour @GUI_TOUR_004 @TC_0GUI_TKATR04
  Scenario: I verify the take a tour option under the settings menu and verify the contents of each page

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap help
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I tap serviceoverview button
  Then I assert all elements on 1st page of serviceoveview
  Then I swipe right to see 2nd page of serviceoverview
  Then I assert all elements on 2nd page of serviceoverview
  Then I swipe right to see 3rd page of serviceoverview
  Then I assert all elements on 3rd page of serviceoverview
  Then I swipe right to see 4th page of serviceoverview
  Then I assert all elements on 4th page of serviceoverview
  Then I swipe right to see 5th page of serviceoverview
  Then I assert all elements on 5th page of overserview
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_TOUR_005 @TakeTour @GUI_TOUR_005 @TC_0GUI_TKATR05
  Scenario: I swipe from left to right and verify text on each view

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap help
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I tap serviceoverview button
  Then I assert all elements on 1st page of serviceoveview
  Then I swipe right to see 2nd page of serviceoverview
  Then I assert all elements on 2nd page of serviceoverview
  Then I swipe right to see 3rd page of serviceoverview
  Then I assert all elements on 3rd page of serviceoverview
  Then I swipe right to see 4th page of serviceoverview
  Then I assert all elements on 4th page of serviceoverview
  Then I swipe right to see 5th page of serviceoverview
  Then I assert all elements on 5th page of overserview
  Then I swipe left to see 4th page of serviceoverview
  Then I assert all elements on 4th page of serviceoverview
  Then I swipe left to see 3rd page of serviceoverview
  Then I assert all elements on 3rd page of serviceoverview
  Then I swipe left to see 2nd page of serviceoverview
  Then I assert all elements on 2nd page of serviceoverview
  Then I swipe left to see 1st page of serviceoverview
  Then I assert all elements on 1st page of serviceoveview
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_TOUR_006 @TakeTour @GUI_TOUR_006 @TC_0GUI_TKATR06
  Scenario: From the Take A Tour view, I verify the back option functionality  

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap help
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I tap serviceoverview button
  Then I assert all elements on 1st page of serviceoveview
  Then I go back to see help view
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_TOUR_007 @TakeTour @GUI_TOUR_007 @TC_0GUI_TKATR07
  Scenario: From the Take A Tour view, I verify the back option functionality from each view

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap help
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I tap serviceoverview button
  Then I assert all elements on 1st page of serviceoveview
  Then I go back to see help view
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I tap serviceoverview button
  Then I swipe right to see 2nd page of serviceoverview
  Then I assert all elements on 2nd page of serviceoverview
  Then I go back to see help view
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I tap serviceoverview button
  Then I swipe right to see 2nd page of serviceoverview
  Then I swipe right to see 3rd page of serviceoverview
  Then I assert all elements on 3rd page of serviceoverview
  Then I go back to see help view
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I tap serviceoverview button
  Then I swipe right to see 2nd page of serviceoverview
  Then I swipe right to see 3rd page of serviceoverview
  Then I swipe right to see 4th page of serviceoverview
  Then I assert all elements on 4th page of serviceoverview
  Then I go back to see help view
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I tap serviceoverview button
  Then I swipe right to see 2nd page of serviceoverview
  Then I swipe right to see 3rd page of serviceoverview
  Then I swipe right to see 4th page of serviceoverview
  Then I swipe right to see 5th page of serviceoverview
  Then I assert all elements on 5th page of overserview
  Then I go back to see help view
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_TOUR_009 @TakeTour @GUI_TOUR_009 @TC_0GUI_TKATR09
  Scenario: I tap the take a tour option and then put device to sleep, I wake up from sleep after a min to see take a tour view

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap help
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I tap serviceoverview button
  Then I assert all elements on 1st page of serviceoveview
  Then I go to sleep
  Then I wake up
  Then I assert all elements on 1st page of serviceoveview
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_TOUR_010 @TakeTour @GUI_TOUR_010 @TC_0GUI_TKATR10
  Scenario: I tap the take a tour option and then navigate to home screen, I launch OM again after 60 seconds to see Take a tour view 

  Given I am on dashboard screen
  Then I tap option settings
  Then I tap help
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I tap serviceoverview button
  Then I assert all elements on 1st page of serviceoveview
  Then I go to home
  Then I launch OM
  Then I assert all elements on 1st page of serviceoveview
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_TOUR_012 @TakeTour @GUI_TOUR_012 @TC_0GUI_TKATR12 @reinstall
  Scenario: I verify Take a Tour option for a client in default mode 

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen  
  Then I activate the app in default mode
  Given I am on dashboard screen
  Then I tap option settings
  Then I assert all elements on option settings view when client is not activated
  Then I tap help
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_TOUR_013 @TakeTour @GUI_TOUR_013 @TC_0GUI_TKATR13 @reinstall 
  Scenario: I verify Take a Tour option for a client in default mode and then activate client with regular profile to see take a tour option  

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen  
  Then I activate the app in default mode
  Given I am on dashboard screen
  Then I tap option settings
  Then I assert all elements on option settings view when client is not activated
  Then I tap help
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I go back to see dashboard view
  Then I tap option settings
  Then I tap activate
  Then I navigate to activation code UI
  Then I enter regular profileid and tap ok
  Then I tap option settings
  Then I tap help
  Then I assert all elements in help page and see take a tour option exists in the UI
  Then I take a screenshot


#####################################################
#DashBoard_General
#####################################################

##################################################################################
    #The below Test case is to be updated in Manual Sheet as the feature is changed
##################################################################################

@AUTO_0GUI_DBRD_GNRL_010 @DASHBOARD @TS_GUI_GNRL_10 @TC_0GUI_DBD10 @reinstall
  Scenario: I validate the "History" Section in the Dashboard,when no connection's are made on the device  

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I assert all the elements on activationcode page
  Then I enter regular profileid and tap ok
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap usage meter
  Then I assert all elements in usage meter view
  Then I swipe right to see application data usage view
  Then I assert all elements in application data usage view
  Then I swipe right to see recent connections view
  Then I assert all elements in recentconnections view
  Then I clear recent connections
  Then I should not see any network in recent connections
  Then I take a screenshot

@AUTO_0GUI_DBRD_GNRL_008 @DASHBOARD @TS_GUI_GNRL_08 @TC_0GUI_DBD08 
    Scenario: I validate the behavoir of browser based network after connecting to it in Dashboard & see the message in Dashboard
    

    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on dashboard screen
    Then I tap "iPassSOA" network
    Then I assert all elements on the complete registration message
    Then I tap ok on the complete registration message
    Then I enter OM credentials
    Then I tap save to see dashboard
    Then I assert all elements on browser login page
    Then I take a screenshot
    Then I tap cancel on browser login page
    Then I assert all elements in network access page when connected to browser based network
    Then I tap disconnect on network access view
    Then I take a screenshot

@AUTO_0GUI_DBRD_GNRL_013 @DASHBOARD @TS_GUI_GNRL_13 @TC_0GUI_DBD13
  Scenario: I validate Dashboard behavior On connecting to the GIS Wi-Fi network in the Dashboard

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap account 
  Then I enter OM credentials
  Then I tap save to see option network UI
  Then I go back
  Then I launch OM
  Then I tap network "IAT-GIS" to connect after credentials are saved
  Given I am on dashboard screen
  Then I set the network name as "IAT-GIS"
  Then I assert elements on the connected network
  Then I take a screenshot

@AUTO_0GUI_DBRD_GNRL_017 @DASHBOARD @TS_GUI_GNRL_17 @TC_0GUI_DBD17
  Scenario: I validate Dashboard behavior on connecting to the Browser/Personal/WEP/WPA1/WPA2 Wi-Fi Network  
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap account 
  Then I enter OM credentials
  Then I tap save to see option network UI
  Then I go back
  Then I launch OM
  Given I am on dashboard screen
  Then I tap "IAT-WEP" network to connect 
  Then I assert all elements on the wifi security key view
  Then I enter security key and tap ok
  Then I assert elements on the connected non ipass network
  Then I take a screenshot

##############################################
#Dashboard_NetworkPanel
##############################################

@AUTO_TC_0GUI_DBRD_NPNL_001 @DASHBOARDNETWORK @TS_GUI_DBNPL01 @reinstall
Scenario:I validate the networkpanel behavior when Wi-Fi is off
 
 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on welcome screen
 Then I assert all elements on welcome screen
 Then I navigate to activation code UI
 Then I assert all the elements on activationcode page
 Then I enter regular profileid and tap ok
 Then I disable Wi-Fi
 Given I am on dashboard screen
 Then I assert all elements in dashboard network panel when wifi is off
 Then I take a screenshot

@AUTO_TC_0GUI_DBRD_NPNL_002 @DASHBOARDNETWORK @TS_GUI_DNPL_02 @TS_GUI_DBNPL02
  Scenario: I validate the network panel when Wi-Fi is Enabled and not connected
 
 Then I connect to IAT-PSK
 Then I launch OM
 Then I disconnect from WiFi
 Given I am on dashboard screen
 Then I assert the elements when wifi enabled but not connected in dashboardnetworkpanel
 Then I take a screenshot

@AUTO_TC_0GUI_DBRD_NPNL_003 @DASHBOARDNETWORK @TS_GUI_DNPL_03 @TS_GUI_DBNPL03
  Scenario: I validate the Dashboard panel when Wi-Fi is enabled and connected
 
 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on dashboard screen
 Then I tap option settings
 Then I tap account
 Then I enter OM credentials
 Then I tap save to see option network UI
 Then I go back
 Then I launch OM
 Given I am on dashboard screen
 Then I tap network "IAT-COLUBRIS" to connect after credentials are saved
 Then I assert elements on the connected network
 Then I take a screenshot

#######################################################
#SpecialNetworking Handling
######################################################

@AUTO_TC_0GUI_SNHL_GNRL_001 @SPECIALNETWORK @TC_GUI_SPLNW_01 @reinstall
   Scenario:I Validate to prohibit an iPass Wi-Fi network after configuring the profile
 
 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on welcome screen
 Then I assert all elements on welcome screen
 Then I navigate to activation code UI
 Then I enter regular profileid and tap ok
 Given I am on dashboard screen
 Then I see if the network "iRoam" is available in wlan
 Then I should not see prohibited network "iRoam"
 Then I take a screenshot

@AUTO_TC_0GUI_SNHL_GNRL_003 @SPECIALNETWORK @TC_GUI_SPLNW_03
  Scenario: I validate to prohibit an iPass Wi-Fi network on Exit & Relaunch of the OMC
 
 Given I am on dashboard screen
 Then I see if the network "iRoam" is available in wlan
 Then I should not see prohibited network "iRoam"
 Then I go to home
 Then I launch OM
 Given I am on dashboard screen
 Then I should not see prohibited network "iRoam"
 Then I take a screenshot

@AUTO_TC_0GUI_SNHL_GNRL_011 @SPECIALNETWORK @TC_GUI_SPLNW_11
  Scenario: I validate to sort an iPass Wi-Fi network on the top List in OMC

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I see the network "IAT-GIS" is available on top of the network list
  Then I take a screenshot

@AUTO_TC_0GUI_SNHL_GNRL_013 @SPECIALNETWORK @TC_GUI_SPLNW_13
  Scenario: I validate to sort an iPass Wi-Fi network on the top List on Exit & Relaunch of OMC
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I see the network "IAT-GIS" is available on top of the network list
  Then I go to home
  Then I launch OM
  Given I am on dashboard screen
  Then I see the network "IAT-GIS" is available on top of the network list
  Then I take a screenshot

@AUTO_TC_0GUI_SNHL_GNRL_017 @SPECIALNETWORK @TC_GUI_SPLNW_17 
  Scenario: I validate to sort an iPass Wi-Fi network on the Top of network section after connecting to it on the dashboard
 
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I see the network "IAT-GIS" is available on top of the network list
  Then I tap "IAT-GIS" network
  Then I assert all elements on the complete registration message
  Then I tap ok on the complete registration message
  Then I enter OM credentials
  Then I tap save to see dashboard
  Given I am on dashboard screen
  Then I see "IAT-GIS" on the connection status and top of the networks section
  Then I take a screenshot

@AUTO_TC_0GUI_SNHL_GNRL_018 @SPECIALNETWORK @TC_GUI_SPLNW_18
  Scenario: I validate to sort & Display an ipass Wi-Fi network on top after connecting to any other Wi-Fi Network in the OMC
 
 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on dashboard screen
 Then I tap option settings
 Then I tap account
 Then I enter OM credentials
 Then I tap save to see option network UI
 Then I go back
 Then I launch OM
 Given I am on dashboard screen
 Then I tap network "IAT-COLUBRIS" to connect after credentials are saved
 Then I may or may not see the "IAT-GIS" network on top of the list
 Then I take a screenshot

@AUTO_TC_0GUI_SNHL_GNRL_002 @SPECIALNETWORK @TC_GUI_SPLNW_02 @reinstall
 Scenario: I validate to prohibit a personal network after cofiguring the profile

 
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I assert all the elements on activationcode page
  Then I enter pin profile id
  Then I enter pin for pin profile id
  Then I enter an email address
  Then I tap ok button on activationcode page to see travel preference view 
  Then I tap lets start on travel preference view
  Given I am on dashboard screen
  Then I see if the network "IAT-PROXY" is available in wlan
  Then I should not see prohibited network "IAT-PROXY"
  Then I take a screenshot

@AUTO_TC_0GUI_SNHL_GNRL_004 @SPECIALNETWORK @TC_GUI_SPLNW_04
 Scenario: I validate to prohibit a personal Wi-Fi network on Exit & Relaunch of the OMC

 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on dashboard screen
 Then I see if the network "IAT-PROXY" is available in wlan
 Then I should not see prohibited network "IAT-PROXY"
 Then I go to home
 Then I launch OM
 Then I should not see prohibited network "IAT-PROXY"
 Then I take a screenshot

 @AUTO_TC_0GUI_SNHL_GNRL_012 @SPECIALNETWORK @TC_GUI_SPLNW_12
  Scenario: I validate to sort a Personal Wi-Fi Network on top of the List on OMC

  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I disconnect from WiFi
  Then I launch OM
  Then I see the network "IAT-PSK" is available on top of the network list
  Then I take a screenshot

@AUTO_TC_0GUI_SNHL_GNRL_014 @SPECIALNETWORK @TC_GUI_SPLNW_14
   Scenario: I validate to sort a Personal Wi-Fi Network on top of the List on Exit & Relaunch of OMC
 
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I disconnect from WiFi
  Then I launch OM
  Then I see the network "IAT-PSK" is available on top of the network list
  Then I go to home 
  Then I launch OM
  Then I see the network "IAT-PSK" is available on top of the network list
  Then I take a screenshot

   #############################################################
  #NETWORKLIST_GENERAL
  #############################################################

@AUTO_TC_0GUI_NLST_GNRL_002 @NETWORKLIST @TS_GUI_NWLST_002 @reinstall
   Scenario: I validate the networklist when Wi-Fi is off and check the UI

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter regular profileid and tap ok
  Then I disable Wi-Fi
  Given I am on dashboard screen
  Then I assert all elements in dashboard network panel when wifi is off
  Then I take a screenshot

@AUTO_TC_0GUI_NLST_GNRL_003 @NETWORKLIST @TS_GUI_NWLST_003
  Scenario: I validate the settings/Account dialogue box when Wi-Fi is enabled /ON and not connected
  
  Given I am on dashboard screen
  Then I enable Wi-Fi
  Given I am on dashboard screen
  Then I tap "IAT-GIS" network
  Then I assert all elements on the complete registration message
  Then I tap ok on the complete registration message
  Then I assert all elements on the account view
  Then I take a screenshot
#########################################################
#TC-09,TC-14,TC-16,TC-23 covered here
#########################################################

@AUTO_TC_0GUI_NLST_GNRL_009 @NETWORKLIST @TS_GUI_NWLST_009
 Scenario: I validate for the messaging sequence when connecting to iPass/Open WiFi network
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I tap "IAT-GIS" network
  Then I assert all elements on the complete registration message
  Then I tap ok on the complete registration message
  Then I enter OM credentials
  Then I tap save to see dashboard
  Given I am on dashboard screen
  Then I assert elements on the connected network
  Then I take a screenshot

@AUTO_TC_0GUI_NLST_GNRL_010 @NETWORKLIST @TS_GUI_NWLST_010
 Scenario: I validate the messaging sequence when connecting to Personal/WEP/WPA1/WPA2 enabled Wi-Fi network

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap account
  Then I enter OM credentials
  Then I tap save to see option network UI
  Then I go back
  Then I launch OM
  Given I am on dashboard screen
  Then I tap "IAT-WEP" network to connect 
  Then I assert all elements on the wifi security key view
  Then I enter security key and tap ok
  Given I am on dashboard screen
  Then I assert elements on the connected non ipass network
  Then I take a screenshot

@AUTO_TC_0GUI_NLST_GNRL_021 @NETWORKLIST @TS_GUI_NWLST_021
 Scenario: I validate the "Cancel" button in the dialog box on connecting to any network in network panel

 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on dashboard screen
 Then I tap option settings
 Then I tap account
 Then I enter OM credentials
 Then I tap save to see option network UI
 Then I go back
 Then I launch OM
 Then I disconnect from WiFi
 Given I am on dashboard screen
 Then I tap network "ibahn" to connect after credentials are saved
 Given I am on dashboard screen
 Then I tap "IAT-PSK" network to see network connect view
 Then I assert all elements on network connect view
 Then I tap cancel on network connect message view
 Then I take a screenshot

##################################################
#TC-22,TC-25 covered here
##################################################

@AUTO_TC_0GUI_NLST_GNRL_022 @NETWORKLIST @TS_GUI_NWLST_022
 Scenario: I validate the "OK" button in the dialog box on connecting to any network in network panel

 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on dashboard screen
 Then I tap option settings
 Then I tap account
 Then I enter OM credentials
 Then I tap save to see option network UI
 Then I go back
 Then I launch OM 
 Given I am on dashboard screen
 Then I tap network "ibahn" to connect after credentials are saved
 Given I am on dashboard screen
 Then I tap "IAT-WEP" network
 Then I assert all elements on network connect view
 Then I tap ok on network connect message view
 Then I assert all elements on the wifi security key view
 Then I enter security key and tap ok
 #Then I assert elements on the connected network
 #Then I tap disconnect on network access view
 Then I take a screenshot

@AUTO_TC_0GUI_NLST_GNRL_027 @NETWORKLIST @TS_GUI_NWLST_027
  Scenario: I validate connectivity behavior of an iPass network by providing invalid credentials in Account Settings and connect to it

 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on dashboard screen
 Then I tap option settings
 Then I tap account
 Then I enter android "prefix" in account settings view
 Then I enter android "username" in account settings view
 Then I assert all elements in warning message view
 Then I tap ok button on warning message view
 Then I enter android "password" in account settings view
 Then I enter android "domain" in account settings view
 Then I tap save to see option network UI
 Then I go back 
 Then I launch OM
 Given I am on dashboard screen
 Then I tap "IAT-COLUBRIS" network from the networklist and check authentication
 Then I assert all elements on authentication problem page
 Then I take a screenshot 

#########################################################
#TC-28,29 covered here
#########################################################

 @AUTO_TC_0GUI_NLST_GNRL_028 @NETWORKLIST @TS_GUI_NWLST_028
  Scenario: I verify that when connecting to a Wi-Fi network ,the network entry should be moved to the top panel

 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on dashboard screen
 Then I tap option settings
 Then I tap account
 Then I enter OM credentials
 Then I tap save to see option network UI
 Then I go back
 Then I launch OM
 Given I am on dashboard screen
 Then I tap network "ibahn" to connect after credentials are saved
 Then I see "ibahn" on the connection status and top of the networks section
 Then I take a screenshot

@AUTO_TC_0GUI_NLST_GNRL_032 @NETWORKLIST @TS_GUI_NWLST_032
  Scenario: I validate the OMC ,When phone is set to airplane mode
 
 Then I connect to IAT-PSK
 Then I launch OM
 Given I am on dashboard screen
 Then I get all Wi-Fi networks
 Then I go to home
 Then I launch OM
 Then I turn on airplane mode
 Given I am on dashboard screen
 Then I assert all elements in dashboard network panel when wifi is off
 Then I take a screenshot
 Then I turn off airplane mode
 Then I launch OM
 Then I get all Wi-Fi networks
 Then I take a screenshot

@AUTO_TC_0GUI_NLST_GNRL_033 @NETWORKLIST @TS_GUI_NWLST_033 @reinstall
  Scenario: I validate the message when trying to connect to a browser based network in network panel

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap account
  Then I enter OM credentials
  Then I tap save to see option network UI
  Then I go back to see dashboard
  Then I tap the "iPassSOA" network
  Then I assert all elements on browser login page
  Then I take a screenshot

@AUTO_TC_0GUI_NLST_GNRL_034 @NETWORKLIST @TS_GUI_NWLST_034
  Scenario: I validate Wi-Fi button on the Dashboard page

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I see the wifi button exists in dashboard network panel
  Then I take a screenshot

@AUTO_TC_0GUI_NLST_GNRL_036 @NETWORKLIST @TS_GUI_NWLST_036 
  Scenario: I validate the dashboard when the Wi-Fi button is switching from ON to OFF

  Then I connect to IAT-PSK
  Then I launch OM
  Then I disable Wi-Fi
  Given I am on dashboard screen
  Then I assert all elements in dashboard network panel when wifi is off
  Then I take a screenshot
@AUTO_TC_0GUI_NLST_GNRL_038 @NETWORKLIST @TS_GUI_NWLST_038
 Scenario: I validate the Wi-Fi button on switching from OFF to ON and check the behavior in the UI

  Then I connect to IAT-PSK
  Then I launch OM
  Then I disable Wi-Fi
  Given I am on dashboard screen
  Then I assert all elements in dashboard network panel when wifi is off
  Then I enable Wi-Fi
  Given I am on dashboard screen
  Then I get all Wi-Fi networks
  Then I take a screenshot

#################################
#Manual Login:FavoriteList 
#################################

@AUTO_TC_0GUI_STGS_0MNL_001 @FavoriteList @TC_GUI_FAVN_01 @reinstall 
  Scenario: I validate a preffered Personal SSID and check the behavior in dashboard
  
   Then I connect to IAT-PSK
   Then I launch OM
   Given I am on welcome screen
   Then I assert all elements on welcome screen
   Then I navigate to activation code UI
   Then I enter regular profileid and tap ok
   Given I am on dashboard screen
   Then I tap option settings
   Then I tap settings
   Then I assert all elements on OptionNetwork UI
   Then I tap manual login
   Then I assert all elements in manual login UI
   Then I tap favoritelist
   Then I assert all elements on favoritelist view
   Then I tap a personal nework "IAT-WEP" from favoritelist and check behavior in dashboard
   #Then I tap a personal nework "Vodafone IN" from favoritelist and check behavior in dashboard
   Then I assert all elements after tapping on a network from favoritelist
   Then I have to see dashboard
   Then I assert all elements on the wifi security key view
   Then I enter security key and tap ok
   Given I am on dashboard screen
   Then I set the network name as "Vodafone IN"
   Then I assert elements on the connected non ipass network
   Then I take a screenshot

@AUTO_TC_0GUI_STGS_0MNL_002 @FavoriteList @TC_GUI_FAVN_02 @reinstall 
  Scenario: I validate by adding a prohibited network into favorite list and check the behavior in dashboard
   
   Then I connect to IAT-PSK
   Then I launch OM
   Then I tap option settings
   Then I tap settings
   Then I assert all elements on OptionNetwork UI
   Then I tap manual login
   Then I assert all elements in manual login UI
   Then I tap favoritelist
   Then I assert all elements on favoritelist view
   Then I tap to exclude the network from the favoritelist
   Then I enter network "iRoam" to favoritelist
   Then I assert all elements after tapping on a network from favoritelist
   Then I have to see dashboard
   Then I assert all elements on dashboard page
   Then I take a screenshot   
###################################
 #TC-03,TC-09 and TC-13 covered here
 ###################################  
@AUTO_TC_0GUI_STGS_0MNL_003 @FavoriteList @TC_GUI_FAVN_03 @reinstall
  Scenario: I validate by adding an SSID into Favoritelist when WiFi off and check the behavoir in dashboard
   
   Then I disable Wi-Fi
   Then I launch OM
   Then I clear password for network "IAT-WEP"
   Given I am on dashboard screen
   Then I tap option settings
   Then I tap settings
   Then I assert all elements on OptionNetwork UI
   Then I tap manual login
   Then I assert all elements in manual login UI
   Then I tap favoritelist
   Then I assert all elements in favoritelist view when wifi off
   Then I tap to exclude the network from the favoritelist
   Then I enter network "IAT-WEP" to favoritelist
   Then I have to see dashboard
   Then I enable Wi-Fi
   Then I assert all elements on the wifi security key view
   Then I enter security key and tap ok
   Then I take a screenshot

@AUTO_TC_0GUI_STGS_0MNL_005 @FavoriteList @TC_GUI_FAVN_04 @reinstall
  Scenario: I validate by adding an SSID into Favorite List and deleting it from Favorite List and check the behavior in dashboard
   
   Then I connect to IAT-PSK
   Then I launch OM
   Given I am on dashboard screen
   Then I clear password for network "IAT-WEP"
   Then I tap option settings
   Then I tap settings
   Then I assert all elements on OptionNetwork UI
   Then I tap manual login
   Then I assert all elements in manual login UI
   Then I tap favoritelist
   Then I assert all elements on favoritelist view
   Then I tap to exclude the network from the favoritelist
   Then I tap a personal nework "IAT-WEP" from favoritelist and check behavior in dashboard
   Then I assert all elements after tapping on a network from favoritelist
   Then I have to see dashboard
   Then I launch OM
   Then I assert all elements on the wifi security key view
   Then I enter security key and tap ok
   Given I am on dashboard screen
   Then I tap option settings
   Then I tap settings
   Then I assert all elements on OptionNetwork UI
   Then I tap manual login
   Then I assert all elements in manual login UI
   Then I tap favoritelist
   Then I assert all elements on favoritelist view
   Then I tap to exclude the network from the favoritelist
   Then I have to see dashboard
   Then I assert all elements on dashboard page
   Then I take a screenshot
@AUTO_TC_0GUI_STGS_0MNL_005 @FavoriteList @TC_GUI_FAVN_05 @reinstall   
  Scenario: I validate by adding an iPass network after credentials are saved and check the behavior in dashboard by enabling Wi-Fi

  Given I am on dashboard screen
  Then I clear account settings
  Then I tap option settings
  Then I tap account
  Then I enter OM credentials
  Then I tap save to see option network UI
  Then I tap manual login
  Then I assert all elements in manual login UI
  Then I tap favoritelist
  Then I assert all elements on favoritelist view
  Then I enter network "IAT-GIS" to favoritelist
  Then I have to see dashboard
  Given I am on dashboard screen
  Then I set the network name as "IAT-GIS"
  Then I assert elements on the connected network
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_0MNL_006 @FavoriteList @TC_GUI_FAVN_06 @reinstall
  Scenario: I validate by adding a browser based network and check the behavior in dashboard

  Given I am on dashboard screen
  Then I clear account settings
  Then I tap option settings
  Then I tap account
  Then I enter OM credentials
  Then I tap save to see option network UI
  Then I tap manual login
  Then I assert all elements in manual login UI
  Then I tap favoritelist
  Then I assert all elements on favoritelist view
  Then I tap to exclude the network from the favoritelist
  Then I enter network "iPassSOA" to favoritelist
  Then I have to see dashboard
  Then I assert all elements on browser login page
  Then I take a screenshot 

@AUTO_TC_0GUI_STGS_0MNL_007 @FavoriteList @TC_GUI_FAVN_07 @reinstall
 Scenario: I validate after connecting a BL network and when disconnect from dashboard client connect a preffered network if marked as favorite network
  
  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I clear password for network "IAT-WEP"
  Given I am on dashboard screen
  Then I clear account settings
  Then I tap option settings
  Then I tap account
  Then I enter OM credentials
  Then I tap save to see option network UI
  Then I tap manual login
  Then I assert all elements in manual login UI
  Then I tap favoritelist
  Then I assert all elements on favoritelist view
  Then I tap to exclude the network from the favoritelist
  Then I tap a personal nework "IAT-WEP" from favoritelist and check behavior in dashboard
  Then I assert all elements after tapping on a network from favoritelist
  Then I have to see dashboard
  Then I launch OM
  Then I assert all elements on the wifi security key view
  Then I enter security key and tap ok
  Given I am on dashboard screen
  Then I tap the "iPassSOA" network
  Then I assert all elements on browser login page
  Then I tap cancel on browser login page
  Then I tap disconnect on network access view
  Then I set the network name as "IAT-WEP"
  Given I am on dashboard screen
  Then I assert elements on the connected non ipass network
  Then I take a screenshot
@AUTO_TC_0GUI_STGS_0MNL_008 @FavoriteList @TC_GUI_FAVN_08 @reinstall
 Scenario: I validate after successfully connecting to a ipass network and disconnecting from dashboard client connect to a favorite network 

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I clear account settings
  Then I tap option settings
  Then I tap account
  Then I enter OM credentials
  Then I tap save to see option network UI
  Then I go back to see dashboard
  Then I tap network "IAT-GIS" to connect after credentials are saved
  Given I am on dashboard screen
  Then I tap disconnect on network access view
  Given I am on dashboard screen
  Then I set the network name as "IAT-WEP"
  Then I assert elements on the connected non ipass network
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_0MNL_009 @FavoriteList @TC_GUI_FAVN_09 @reinstall
  Scenario: I validate after giving wrong credentials and connecting to an iPass network and disconnecting from it in dashboard client connect to Favorite network

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on dashboard screen
  Then I clear account settings
  Then I tap option settings
  Then I tap account
  Then I enter android "prefix" in account settings view
  Then I enter android "username" in account settings view
  Then I assert all elements in warning message view
  Then I tap ok button on warning message view
  Then I enter android "password" in account settings view
  Then I enter android "domain" in account settings view
  Then I tap save to see option network UI
  Then I go back to see dashboard
  Then I tap "IAT-COLUBRIS" network from the networklist and check authentication
  Then I assert all elements on authentication problem page
  Then I tap ok on authentication problem view
  Given I am on dashboard screen
  Then I set the network name as "IAT-WEP"
  Then I assert elements on the connected non ipass network
  Then I take a screenshot
#################################
#Manual Login:ExcludedNetworkList 
##################################

@AUTO_TC_0GUI_STGS_0MNL_001 @ExcludeNetwork @TC_GUI_EXCLN_01 @reinstall 
 Scenario: I validate Adding an existing network from the excluded list and check the behavior in dashboard after connecting to it.
  
  Given I am on dashboard screen
  Then I clear account settings
  Then I tap option settings
  Then I tap account
  Then I enter OM credentials
  Then I tap save to see option network UI
  Then I tap manual login
  Then I assert all elements in manual login UI
  Then I tap excludednetworklist
  Then I assert all elements on excludednetworklist view
  Then I tap the nework "Tata Docomo Wi-Fi" from excludednetworklist and check behavior in dashboard
  Then I assert all elements after tapping on a network from excludednetworklist
  Then I have to see dashboard
  Then I launch OM
  Given I am on dashboard screen
  Then I tap the "Tata Docomo Wi-Fi" network
  Then I assert all elements on browser login page
  Then I take a screenshot
@AUTO_TC_0GUI_STGS_0MNL_002 @ExcludeNetwork @TC_GUI_EXCLN_02 @reinstall 
 Scenario: I validate Excluded Network List UI when WiFi is off
  
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap settings
  Then I assert all elements on OptionNetwork UI
  Then I tap manual login
  Then I assert all elements in manual login UI
  Then I tap excludednetworklist
  Then I assert all elements in excludednetworklist view when wifi off
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_0MNL_003 @ExcludeNetwork @TC_GUI_EXCLN_03 @reinstall 
  Scenario: I validate the scrolling behavior after adding 10 or more SSID to Excluded Network List  
  
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap settings
  Then I assert all elements on OptionNetwork UI
  Then I tap manual login
  Then I assert all elements in manual login UI
  Then I tap excludednetworklist
  Then I assert all elements on excludednetworklist view
  Then I add 10 or more networks into ExcludedNetworklist
  Then I scroll_up
  Then I assert all elements after tapping on a network from excludednetworklist
  Then I take a screenshot

@AUTO_TC_0GUI_STGS_0MNL_004 @ExcludeNetwork @TC_GUI_EXCLN_04 @reinstall
  Scenario: I validate by adding and deleting any iPass network to excluded network list and check the behavior in dashboard 
  
  Given I am on dashboard screen
  Then I clear account settings
  Then I tap option settings
  Then I tap account
  Then I enter OM credentials
  Then I tap save to see option network UI
  Then I tap manual login
  Then I assert all elements in manual login UI
  Then I tap excludednetworklist
  Then I assert all elements on excludednetworklist view
  Then I tap the nework "Tata Docomo Wi-Fi" from excludednetworklist and check behavior in dashboard
  Then I assert all elements after tapping on a network from excludednetworklist
  Then I have to see dashboard
  Then I launch OM
  Given I am on dashboard screen
  Then I tap the "Tata Docomo Wi-Fi" network
  Then I assert all elements on browser login page
  Then I tap cancel on browser login page
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap settings
  Then I assert all elements on OptionNetwork UI
  Then I tap manual login
  Then I assert all elements in manual login UI
  Then I tap excludednetworklist
  Then I assert all elements on excludednetworklist view
  Then I tap to exclude the network from the excludednetworklist
  Then I have to see dashboard
  Given I am on dashboard screen
  Then I tap network "Tata Docomo Wi-Fi" to connect after credentials are saved
  Given I am on dashboard screen
  Then I assert elements on the connected network
  Then I take a screenshot              

  


