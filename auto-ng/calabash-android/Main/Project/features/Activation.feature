Feature: Activation


############################
#Activation Code#
############################

@AUTO_TC_ACTV_PRFL_CODE_001 @ActivationCode @AC01 @reinstall
  Scenario: As a valid user Id like to validate the activation code UI
    Then I disconnect from WiFi
    Then I launch OM
    Given I am on welcome screen
   	Then I assert all elements on welcome screen
    Then I navigate to activation code UI
    Then I assert all the elements on activationcode page
    Then I take a screenshot

# @AUTO_TC_ACTV_PRFL_CODE_002 - TC01 takes care of this scenario

@AUTO_TC_ACTV_PRFL_CODE_003 @ActivationCode @AC03
  Scenario: After an Installation, I click Activation code and validate the error message for "No Internet Connectivity"
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter wrong profile id
    Then I enter an email address
    Then I tap ok on the activationcode page to see internet error message
    Then I assert all elements on the internet error dialog
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_004 @ActivationCode @AC04
  Scenario: After an installation, I navigate to Activation code UI and then validate the cancel button
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I tap cancel button on activationcode page
    Then I assert all elements on welcome screen
    Then I take a screenshot

 @AUTO_TC_ACTV_PRFL_CODE_005 @ActivationCode @AC05
   Scenario: After an installation, I verify profile activation with a profile that has no wifi directories
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter noWifi profile id
    Then I enter an email address
    Then I tap ok button on activationcode page to see om dashboard
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_008 @ActivationCode @AC08 @reinstall
   Scenario: After an installation, I activate the profile and when in progress, I navigate to home screen
    Then I connect to IAT-PSK
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter pin profileid and tap ok
    Then I go to home
    Then I wait for 20 seconds
    Then I launch OM
    Then I assert all elements on dashboard page
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_009 @ActivationCode @AC09 @reinstall
   Scenario: After an installation, I validate the "Try again" option that will be available incase of failures due to incorrect profile id/pin
    Then I connect to IAT-PSK
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter wrong profile id
    Then I enter an email address
    Then I tap ok on the activationcode page to see wrong activationcode message
    Then I tap try again to see activation code page
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_011 @ActivationCode @AC11
  Scenario: After an installation, I activate the profile by just entering a valid profile ID and no PIN
    Then I connect to IAT-PSK
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter regular profileid and tap ok
    Then I assert all elements on dashboard page
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_013 @ActivationCode @AC13 @reinstall
  Scenario: On the Activation code UI, I validate the profile id field to accept only 10 chars
    Then I connect to IAT-PSK
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I validate the "profileid" field to accept only "10" characters by entering "12" characters
    Then I take a screenshot    

@AUTO_TC_ACTV_PRFL_CODE_016 @ActivationCode @AC16
  Scenario: After an installation, I activate the profile by entering a wrong profile ID and pin and I validate the error message
    Then I connect to IAT-PSK
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter wrong profile id
    Then I enter an email address
    Then I tap ok on the activationcode page to see wrong activationcode message
    Then I assert all the elements on the wrong activation code error page
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_020 @ActivationCode @AC20
  Scenario: On the Activation code UI, I validate the OK button
    Then I connect to IAT-PSK
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I verify if ok button is disabled on activation code page
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_021 @ActivationCode @AC21
  Scenario: After an installation, I activate the profile using a valid profile and pin
    Then I connect to IAT-PSK
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter pin profile id
    Then I enter pin for pin profile id
    Then I enter an email address
    Then I tap ok button on activationcode page to see om dashboard
    Then I assert all elements on dashboard page
    Then I take a screenshot
    
@TC_ACTV_PRFL_CODE_022 @ActivationCode @AC22 @reinstall
  Scenario: On the Activation code UI, I validate the pin field to accept alphanumeric characters
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I validate the pin field to accept alphanumeric characters
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_023 @ActivationCode @AC23
  Scenario: On the Activation code UI, I validate the pin field to more than 32 chars
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I validate the "pin" field to accept only "50" characters by entering "52" characters
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_025 @ActivationCode @AC25
  Scenario: After an installation, I verify the error message shown when a valid profile id and an invalid pin is entered
    Then I connect to IAT-PSK
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter pin profile id
    Then I enter wrong pin
    Then I enter an email address
    Then I tap ok on the activationcode page to see wrong activationcode message
    Then I assert all the elements on the wrong activation code error page
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_026 @ActivationCode @AC26
  Scenario: After an installation, I verify the error message shown when an invalid profile id and a valid pin is entered
    Then I connect to IAT-PSK
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter wrong profile id
    Then I enter pin for pin profile id
    Then I enter an email address
    Then I tap ok on the activationcode page to see wrong activationcode message
    Then I assert all the elements on the wrong activation code error page
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_028 @ActivationCode @AC28
  Scenario: After an installation, I verify the behavior when a PIN is provided for a profile that has no pin configured on the portal
    #Then I connect to IAT-PSK
   # Then I launch OM
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter pin for pin profile id
    Then I enter an email address
    Then I enter regular profileid and tap ok
    Then I assert all elements on dashboard page
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_049 @ActivationCode @AC49 @reinstall
  Scenario: During an activation, I'll enter an invalid email address and then tap try again option to see if the email address is retained
    Then I connect to IAT-PSK
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter wrong profile id
    Then I enter wrong pin
    Then I enter an invalid email address
    Then I tap ok on the activationcode page to see invalid emailformat error message
    Then I assert all the elements on the invalid email error page
    Then I tap try again to see activation code page and email address retained
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_050 @ActivationCode @AC50
  Scenario: After an Installation, I click Activation code and validate the email field
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter wrong profile id
    Then I enter wrong pin
    Then I verify if ok button is disabled on activation code page
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_051 @ActivationCode @AC51
  Scenario: After an Installation, I click Activation code and validate the email field to accept 128 characters
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter regular profile id
    Then I validate the "email" field to accept only "128" characters by entering "119" characters
    Then I tap ok button on activationcode page to see om dashboard
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_053 @ActivationCode @AC53
  Scenario: After an Installation, I click Activation code and validate the email field to accept 128 characters
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I navigate to activation code UI
    Then I enter regular profile id
    Then I enter an email address
    Then I validate the "email" field to accept only "128" characters by entering "119" characters
    Then I tap ok button on activationcode page to see om dashboard
    Then I assert all elements on dashboard page
    Then I take a screenshot


############################
#Activation Wizard#
############################

@AUTO_TC_ACTV_EMAL_ACWZ_003 @ActivationWizard @AW03 @reinstall
  Scenario: After an install, I tap "Get Started" with no internet connectivity and validate the error message
    Then I disconnect from WiFi
    Then I launch OM
    Given I am on welcome screen
    Then I assert all elements on the welcome screen
    Then I tap get started to see internet error message
    Then I assert all elements on the internet error dialog
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_004 @ActivationWizard @AW04
  Scenario: After an install, I validate the activate later option
    Then I connect to IAT-WEP
    Given I am on welcome screen
    Then I assert all elements on the welcome screen
    Then I activate the app in default mode
    Then I take a screenshot

@AUTO_EMAL_ACWZ_005 @ActivationWizard @AW05
  Scenario: I validate the activate option from the settings menu
    Given I am on welcome screen
    Then I assert all elements on the welcome screen
    Then I activate the app in default mode
    Then I tap option settings
    Then I assert all elements on option settings view when client is not activated
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_006 @ActivationWizard @AW06 @reinstall
  Scenario: I tap the get started option and validate the UI for the Email page
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I assert all elements on the welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_009 @ActivationWizard @AW09
  Scenario: I validate the email field in the activation wizard by entering in an invalid email id
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter an invalid email format on the email page
    Then I tap continue to see email validation error
    Then I assert the error shown for an invalid email id
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_010 @ActivationWizard @AW10
  Scenario: I validate the email field in the activation wizard by not entering any value
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I tap continue to see email validation error
    Then I assert the error shown for an invalid email id
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_011 @ActivationWizard @AW11
  Scenario: I enter a valid email address to the email field and tap continue button to validate the message shown on the wizard
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter a valid email on the email page
    Then I tap continue to see account page
    Then I assert all elements on the account page
    Then I take a screenshot

#@AUTO_TC_ACTV_EMAL_ACWZ_012 @ActivationWizard @AW12 - TC11 Covers this
 # Scenario: I enter a valid email address to the email field and tap continue button to see Username/Password/Domain fields

@AUTO_TC_ACTV_EMAL_ACWZ_019 @ActivationWizard @AW19
  Scenario: I enter a valid email address to the email field and tap continue button and then validate all the fields for null values
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter a valid email on the email page
    Then I tap continue to see account page
    Then I tap continue to see an error
    Then I assert the error shown for username field
    Then I wait for 2 seconds
    Then I enter a valid username on the account page
    Then I tap continue to see an error
    Then I assert the error shown for password field
    Then I wait for 2 seconds
    Then I enter a valid password on the account page    
    Then I enter a empty value for domain on the account page
    Then I tap continue to see an error
    Then I assert the error shown for domain field
    Then I wait for 2 seconds
    Then I take a screenshot

@TC_ACTV_EMAL_ACWZ_020 @ActivationWizard @AW20
  Scenario: I enter a valid email address to the email field and tap continue button and then enter valid credentials to validate the finish activation page
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter a valid email on the email page
    Then I tap continue to see account page
    Then I assert all elements on the account page
    Then I enter a valid username on the account page
    Then I enter a valid password on the account page    
    Then I tap continue to see finish page
    Then I assert all elements on the finish page
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_021 @ActivationWizard @AW21
  Scenario: I enter a valid email address and complete the activation process. I validate to see if the client is activated with the favourite profile
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter a valid email on the email page
    Then I tap continue to see account page
    Then I assert all elements on the account page
    Then I enter a valid username on the account page
    Then I enter a valid password on the account page    
    Then I tap continue to see finish page
    Then I assert all elements on the finish page
    Then I tap finish on activation finish page to see dashboard
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I assert all elements on option settings view
    Then I tap about
    Then I verify profile id with "fav_profile_id"
    Then I take a screenshot

#Pending
#@TC_ACTV_EMAL_ACWZ_022 @ActivationWizard @AW22 @reinstall @wip
 # Scenario: After an activation, I make a connection to a iPass Network
  #  Then I launch OM
   # Then I have to see "Accept"
   # When I press button with text "Accept" 
   # Then I have to see "iPass Open Mobile"
   # Then I have to see "Get Started"
   # When I press button with text "Get Started"
   # Then I wait for "email" page to load
   # Then I have to see message with id "emailLabel"
   # Then I enter "validEmail" into "email" field
   # Then I tap "emailButton" button
   # Then I wait for "username" page to load
   # Then I enter "validUser" into "username" field
   # Then I enter "validPassword" into "password" field
   # Then I tap "accountButton" button
   # When I press button with text "Never"
   # Then I wait for "confirmActivationDiv" page to load
   # Then I have to see message with id "congratulations"
   # Then I tap "confirmActivationDiv" button
   # Then I wait for 15 seconds
   # Then I see OM dashboard

    # Connect to a GIS Network
   # Then I connect to GIS network
   # Then I take a screenshot

@TC_ACTV_EMAL_ACWZ_023 @ActivationWizard @AW23
  Scenario: After an activation, I validate the data in the account fields
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter a valid email on the email page
    Then I tap continue to see account page
    Then I assert all elements on the account page
    Then I enter a valid username on the account page
    Then I enter a valid password on the account page    
    Then I tap continue to see finish page
    Then I assert all elements on the finish page
    Then I tap finish on activation finish page to see dashboard
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I tap account
    Then I verify if the credentials are saved after activating via activation wizard
    Then I take a screenshot

#@AUTO_TC_ACTV_EMAL_ACWZ_024 @ActivationWizard @AW24 @reinstall - Cannot Automate
  #Scenario: During an activation process, I verify to see if the prefix field is shown on the wizard
   
@AUTO_TC_ACTV_EMAL_ACWZ_025 @ActivationWizard @AW25 
  Scenario: After an activation process, I verify if the prefix option is shown in the account UI
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter a valid email on the email page
    Then I tap continue to see account page
    Then I assert all elements on the account page
    Then I enter a valid username on the account page
    Then I enter a valid password on the account page    
    Then I tap continue to see finish page
    Then I assert all elements on the finish page
    Then I tap finish on activation finish page to see dashboard
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I tap account
    Then I assert all elements on the account view
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_026 @ActivationWizard @AW26
  Scenario: After activation, I verify the prefix value matches to what's configured in the xml
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter a valid email on the email page
    Then I tap continue to see account page
    Then I assert all elements on the account page
    Then I enter a valid username on the account page
    Then I enter a valid password on the account page    
    Then I tap continue to see finish page
    Then I assert all elements on the finish page
    Then I tap finish on activation finish page to see dashboard
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I tap account
    Then I verify if the prefix value is as configured in the xml
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_027 @ActivationWizard @AW27 @reinstall
  Scenario: During activation, I enter invalid credentails and validate the error message
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter a valid email on the email page
    Then I tap continue to see account page
    Then I enter invalid username on the account page
    Then I enter invalid password on the account page
    Then I tap continue on account page to see wrong account info error for a favourite profile
    Then I assert all elements on the error shown when invalid credentials are entered for a favourite profile
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_028 @ActivationWizard @AW28
  Scenario: During activation, I enter invalid credentails and then tap the retry option
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter a valid email on the email page
    Then I tap continue to see account page
    Then I enter invalid username on the account page
    Then I enter invalid password on the account page
    Then I tap continue on account page to see wrong account info error for a favourite profile
    Then I assert all elements on the error shown when invalid credentials are entered for a favourite profile
    Then I tap retry to see account page
    Then I assert all elements on the account page
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_029 @ActivationWizard @AW29
  Scenario: During activation, I enter invalid credentails, tap the retry option and then enter valid credentials to see if the activation process continous   
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter a valid email on the email page
    Then I tap continue to see account page
    Then I enter invalid username on the account page
    Then I enter invalid password on the account page
    Then I tap continue on account page to see wrong account info error for a favourite profile
    Then I assert all elements on the error shown when invalid credentials are entered for a favourite profile
    Then I tap retry to see account page
    Then I assert all elements on the account page
    Then I enter a valid username on the account page
    Then I enter a valid password on the account page    
    Then I tap continue to see finish page
    Then I assert all elements on the finish page
    Then I take a screenshot

#@AUTO_TC_ACTV_EMAL_ACWZ_030 @ActivationWizard @AW30 - TC31 Covers this scenario
  #Scenario: During activation, I enter invalid credentails and then tap the continue option to see if the activation process continous

@AUTO_TC_ACTV_EMAL_ACWZ_031 @ActivationWizard @AW31 @reinstall
  Scenario: During activation, I enter invalid credentails and then tap the continue option to activate the client
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter a valid email on the email page
    Then I tap continue to see account page
    Then I enter invalid username on the account page
    Then I enter invalid password on the account page
    Then I tap continue on account page to see wrong account info error for a favourite profile
    Then I assert all elements on the error shown when invalid credentials are entered for a favourite profile
    Then I tap continue to see dashboard
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I assert all elements on option settings view
    Then I tap about
    Then I verify profile id with "fav_profile_id"
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_032 @ActivationWizard @AW32 @reinstall
  Scenario: During activation, I enter invalid credentails and then tap the continue option to see if the activation process continous. I then validate the data in the accounts section
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter a valid email on the email page
    Then I tap continue to see account page
    Then I enter invalid username on the account page
    Then I enter invalid password on the account page
    Then I tap continue on account page to see wrong account info error for a favourite profile
    Then I assert all elements on the error shown when invalid credentials are entered for a favourite profile
    Then I tap continue to see dashboard
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I assert all elements on option settings view
    Then I tap account
    Then I should not see any credentials populated on the account view
    Then I take a screenshot

#@AUTO_TC_ACTV_EMAL_ACWZ_033 @ActivationWizard @AW33 - Revisit

#@AUTO_TC_ACTV_EMAL_ACWZ_034 @ActivationWizard @AW34 @reinstall - TC31 Covers this scenario
 # Scenario: I activate the client by entering a valid email and invalid credentails and verify if the client is activated with the fav profile id (The Favorite profile being PIN enabled)
  
@AUTO_TC_ACTV_EMAL_ACWZ_035 @ActivationWizard @AW35 @reinstall
  Scenario: During activation, I enter a valid email and valid credentials and verify no faviorite profile message
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter no favourite profile on the email page
    Then I tap continue to see account page
    Then I assert all elements on the account page
    Then I enter no favourite username on the account page
    Then I enter no favourite password on the account page
    Then I tap continue on account page to see no favourite profile page
    Then I assert all elements on the no favourite profile page
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_036 @ActivationWizard @AW36
  Scenario: During activation, I enter valid email and valid credentials and verify if the client is activated with the generic profile
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter no favourite profile on the email page
    Then I tap continue to see account page
    Then I assert all elements on the account page
    Then I enter no favourite username on the account page
    Then I enter no favourite password on the account page
    Then I tap continue on account page to see no favourite profile page
    Then I assert all elements on the no favourite profile page
    Then I tap continue on no favourite profile page to see dashboard
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I tap about
    Then I verify profile id with "generic_profile_id"
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_038 @ActivationWizard @AW38 @reinstall
  Scenario: During activation, I enter valid email and invalid credentials and verify if the client is activated with the generic profile
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter no favourite profile on the email page
    Then I tap continue to see account page
    Then I enter invalid username on the account page
    Then I enter invalid password on the account page
    Then I tap continue on account page to see wrong account info error for a generic profile
    Then I assert all elements on the error shown when invalid credentials are entered for a generic profile
    Then I tap continue to see dashboard
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I tap about
    Then I verify profile id with "generic_profile_id"
    Then I take a screenshot

#@AUTO_TC_ACTV_EMAL_ACWZ_043 @ActivationWizard @AW43 @reinstall - TC31 Covers this scenario
  #Scenario: As a valid user, I activate the profile which is the favourite profile and which has pin enabled for the profile

@AUTO_TC_ACTV_EMAL_ACWZ_048 @ActivationWizard @AW48 @reinstall
  Scenario: As a valid user, I try activating a profile with an invalid email id
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter an invalid email address on the email page
    Then I tap continue on email page to see company not found error
    Then I assert all elements on the error shown when the company is not found
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_049 @ActivationWizard @AW49
  Scenario: As a valid user, I try activating a profile with an invalid email id, tap retry option and then re-enter a valid email address to proceed to the next page
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter an invalid email address on the email page
    Then I tap continue on email page to see company not found error
    Then I assert all elements on the error shown when the company is not found
    Then I tap retry on company not found error to see email page
    Then I enter a valid email on the email page
    Then I tap continue to see account page
    Then I assert all elements on the account page
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_050 @ActivationWizard @AW50
  Scenario: I try activating a profile with an invalid email id, tap continue to verify if the credentials page is shown
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter an invalid email address on the email page
    Then I tap continue on email page to see company not found error
    Then I assert all elements on the error shown when the company is not found
    Then I tap continue on company not found error to see account page    
    Then I assert all elements on the account page when the company is not found
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_052 @ActivationWizard @AW52
  Scenario: I try activating a profile with an invalid email id, tap continue on the error and then enter valid credentials to activate the profile
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter an invalid email address on the email page
    Then I tap continue on email page to see company not found error
    Then I assert all elements on the error shown when the company is not found
    Then I tap continue on company not found error to see account page    
    Then I assert all elements on the account page when the company is not found
    Then I enter a valid username on the account page
    Then I enter a valid password on the account page
    Then I enter a valid domain on the account page
    Then I tap continue to see finish page
    Then I assert all elements on the finish page
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_053 @ActivationWizard @AW53
  Scenario: I enter an invalid email id, tap continue on the error, enter valid credentials and activate the profile with the favorite profile 
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter an invalid email address on the email page
    Then I tap continue on email page to see company not found error
    Then I assert all elements on the error shown when the company is not found
    Then I tap continue on company not found error to see account page    
    Then I assert all elements on the account page when the company is not found
    Then I enter a valid username on the account page
    Then I enter a valid password on the account page
    Then I enter a valid domain on the account page
    Then I tap continue to see finish page
    Then I tap finish on activation finish page to see dashboard
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I assert all elements on option settings view
    Then I tap about
    Then I verify profile id with "fav_profile_id"
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_054 @ActivationWizard @AW54 @reinstall
  Scenario: I validate all the errors by entering an invalid email, tap continue and entering invalid credentails
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter an invalid email address on the email page
    Then I tap continue on email page to see company not found error
    Then I assert all elements on the error shown when the company is not found
    Then I tap continue on company not found error to see account page    
    Then I assert all elements on the account page when the company is not found
    Then I enter invalid username on the account page
    Then I enter invalid password on the account page
    Then I enter invalid domain on the account page
    Then I tap continue on account page to see contact ipass error
    Then I assert all elements on the contact ipass error
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_055 @ActivationWizard @AW55
  Scenario: I validate all the errors by entering an invalid email, tap continue and entering invalid credentails, I then tap the retry button to see if the user is shown the credentials dialog again
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter an invalid email address on the email page
    Then I tap continue on email page to see company not found error
    Then I assert all elements on the error shown when the company is not found
    Then I tap continue on company not found error to see account page    
    Then I assert all elements on the account page when the company is not found
    Then I enter invalid username on the account page
    Then I enter invalid password on the account page
    Then I enter invalid domain on the account page
    Then I tap continue on account page to see contact ipass error
    Then I assert all elements on the contact ipass error
    Then I tap retry on contact ipass error to see account page
    Then I assert all elements on the account page when the company is not found
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_056 @ActivationWizard @AW56
  Scenario: I activate the client with the generic profile by entering invalid email and then entering valid credentails
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter an invalid email address on the email page
    Then I tap continue on email page to see company not found error
    Then I assert all elements on the error shown when the company is not found
    Then I tap continue on company not found error to see account page    
    Then I assert all elements on the account page when the company is not found
    Then I enter no favourite username on the account page
    Then I enter no favourite password on the account page
    Then I enter no favourite domain on the account page
    Then I tap continue on account page to see no favourite profile page
    Then I assert all elements on the no favourite profile page
    Then I tap continue on no favourite profile page to see dashboard
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I tap about
    Then I verify profile id with "generic_profile_id"
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_057 @ActivationWizard @AW57 @reinstall
 Scenario: I enter an invalid email, tap continue on the error message and then enter invalid credentials to validate the contact iPass page
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter an invalid email address on the email page
    Then I tap continue on email page to see company not found error
    Then I assert all elements on the error shown when the company is not found
    Then I tap continue on company not found error to see account page    
    Then I assert all elements on the account page when the company is not found
    Then I enter invalid username on the account page
    Then I enter invalid password on the account page
    Then I enter invalid domain on the account page
    Then I tap continue on account page to see contact ipass error
    Then I assert all elements on the contact ipass error
    Then I tap contact ipass on the error to see contact ipass page
    Then I assert all elements on the contact ipass page
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_069 @ActivationWizard @AW69
  Scenario: I try to activate the profile for a company that has been blocked from using the wizard feature
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter block email on the email page
    Then I tap continue on email page to see company block page
    Then I assert all elements on the company block message
    Then I take a screenshot

@AUTO_TC_ACTV_EMAL_ACWZ_070 @ActivationWizard @AW70
  Scenario: I try to activate using a company ID that is blocked and verify the error shown by entering an invalid email and valid credentails
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter an invalid email address on the email page
    Then I tap continue on email page to see company not found error
    Then I assert all elements on the error shown when the company is not found
    Then I tap continue on company not found error to see account page    
    Then I assert all elements on the account page when the company is not found
    Then I enter a valid username on the account page
    Then I enter a valid password on the account page    
    Then I enter block domain on the account page
    Then I tap continue on email page to see company block page
    Then I assert all elements on the company block message
    Then I take a screenshot

@TC_ACTV_EMAL_ACWZ_074 @ActivationWizard @AW74
  Scenario: I try to activate the profile for a company that has been blocked from using the wizard feature
    Then I connect to IAT-WEP
    Then I launch OM
    Given I am on welcome screen
    Then I tap get started to see email page
    Then I assert all elements on the email page
    Then I enter an invalid email address on the email page
    Then I tap continue on email page to see company not found error
    Then I assert all elements on the error shown when the company is not found
    Then I tap continue on company not found error to see account page    
    Then I assert all elements on the account page when the company is not found
    Then I enter invalid username on the account page
    Then I enter invalid password on the account page
    Then I enter invalid domain on the account page
    Then I tap continue on account page to see contact ipass error
    Then I assert all elements on the contact ipass error
    Then I tap contact ipass on the error to see contact ipass page
    Then I assert all elements on the contact ipass page
    Then I take a screenshot

 ################################
 #Profile Finder
 ################################

 @AUTO_TC_ACTV_PRFL_001 @ProfileFinder @PF01 @reinstall
  Scenario: I verify the successful activation of favorite android profile

   Then I connect to IAT-PSK
   Then I launch OM
   Given I am on welcome screen
   Then I assert all elements on welcome screen
   Then I navigate to activation code UI
   Then I enter favorite android profileid and tap ok
   Given I am on dashboard screen
   Then I assert all elements on dashboard page
   Then I take a screenshot

@AUTO_TC_ACTV_PRFL_006 @ProfileFinder @PF06 @reinstall
  Scenario: I verify the OMC will not get activated when the "PIN" is not entered

   Then I connect to IAT-PSK
   Then I launch OM
   Given I am on welcome screen
   Then I assert all elements on welcome screen
   Then I navigate to activation code UI
   Then I enter pin profile id
   Then I enter an email address
   Then I tap ok on the activationcode page to see wrong activationcode message
   Then I assert all the elements on the wrong activation code error page
   Then I take a screenshot

 @AUTO_TC_ACTV_PRFL_007 @ProfileFinder @PF07 @reinstall
 Scenario: I verify successful actiavation of the android profile using the profile of a different Platforms(iOs/Mac/windows)

   Then I connect to IAT-PSK
   Then I launch OM
   Given I am on welcome screen
   Then I assert all elements on welcome screen
   Then I navigate to activation code UI
   Then I enter favorite windows profileid and tap ok
   Given I am on dashboard screen
   Then I assert all elements on dashboard page
   Then I take a screenshot

@AUTO_TC_ACTV_PRFL_008 @ProfileFinder @PF08 @reinstall
  Scenario: I verify the behavior when a "PIN" is set on different Platform Profile(iOs)

   Then I connect to IAT-PSK
   Then I launch OM
   Given I am on welcome screen
   Then I assert all elements on welcome screen
   Then I navigate to activation code UI
   Then I enter favorite ios profileid and tap ok
   Given I am on dashboard screen
   Then I assert all elements on dashboard page
   Then I take a screenshot

@AUTO_TC_ACTV_PRFL_010 @ProfileFinder @PF10 @reinstall
 Scenario: I verify the behavior when no favorite android profile is set

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter generic profileid and tap ok
  Given I am on dashboard screen
  Then I assert all elements on dashboard page
  Then I take a screenshot
  
@AUTO_TC_ACTV_PRFL_015 @ProfileFinder @PF15 @reinstall
 Scenario: I verify the "Profile ID" and "Profile version" in the "About" page when the OMC is activated with Favorite android profile ID

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter favorite android profileid and tap ok
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap about 
  Then I assert all elements on about page
  #Then I validate the build no on the app
  Then I verify profile id with "fav_profile_id"
  Then I take a screenshot

@AUTO_TC_ACTV_PRFL_016 @ProfileFinder @PF16 @reinstall
 Scenario:  verify the "Profile ID" and "Profile version" in the "About" page when the OMC is activated with Different platform android profile ID(iOs/Mac/Windows) 

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter favorite ios profileid and tap ok
  Given I am on dashboard screen
  Then I tap option settings
  Then I tap about 
  Then I assert all elements on about page
  Then I validate the build no on the app
  Then I verify profile id with "fav_profile_id"
  Then I take a screenshot

@AUTO_TC_ACTV_PRFL_020 @ProfileFinder @PF20 @reinstall
 Scenario: I verify successful activation of the "Default Mode" OMC with a Favorite android profile

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I activate the app in default mode
  Given I am on dashboard screen
  Then I tap option settings
  Then I assert all elements on option settings view when client is not activated
  Then I tap activate
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter favorite android profileid and tap ok
  Given I am on dashboard screen
  Then I assert all elements on dashboard page
  Then I take a screenshot

@AUTO_TC_ACTV_PRFL_021 @ProfileFinder @PF21 @reinstall
 Scenario: I verify successful activation of the "Default Mode" OMC with a Dandroid profile Different platform ID(iOs/Mac/Windows)

  Then I connect to IAT-PSK
  Then I launch OM
  Given I am on welcome screen
  Then I assert all elements on welcome screen
  Then I activate the app in default mode
  Given I am on dashboard screen
  Then I tap option settings
  Then I assert all elements on option settings view when client is not activated
  Then I tap activate
  Then I assert all elements on welcome screen
  Then I navigate to activation code UI
  Then I enter favorite windows profileid and tap ok
  Given I am on dashboard screen
  Then I assert all elements on dashboard page
  Then I take a screenshot        


############################
#Activation By URL#
############################

@AUTO_TC_ACTV_PRFL_0URL_001 @ActivationURL @AURL01
  Scenario: I activate the client with regular profile via URL and verify if the client is activated
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I activate the client with regular profile via the url
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I assert all elements on option settings view
    Then I tap about
    Then I verify profile id with "regular_profile_id"
    Then I take a screenshot

#@TC_ACTV_PRFL_0URL_002, 003 - AURL01 handles this case
#@TC_ACTV_PRFL_0URL_004, 005, 006, 007 - Cannot automate

@AUTO_TC_ACTV_PRFL_0URL_008 @ActivationURL @AURL08
  Scenario: I activate the client via URL when the client is in the default mode
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I activate the app in default mode
    Then I assert all elements on dashboard page
    Then I activate the client with regular profile via the url
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I assert all elements on option settings view
    Then I tap about
    Then I verify profile id with "regular_profile_id"
    Then I take a screenshot

#@TC_ACTV_PRFL_0URL_009 - Revisit, Branded profile

@AUTO_TC_ACTV_PRFL_0URL_010 @ActivationURL @AURL10
  Scenario: I activate the client with a pin enabled profile via URL and verify if the client is activated
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I activate the client with pin profile via the url
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I assert all elements on option settings view
    Then I tap about
    Then I verify profile id with "pin_profile_id"
    Then I take a screenshot

#@TC_ACTV_PRFL_0URL_011, 012 - AURL10 handles this case
#@TC_ACTV_PRFL_0URL_013, 014, 015, 016 - Cannot automate

@AUTO_TC_ACTV_PRFL_0URL_017 @ActivationURL @AURL17
  Scenario: I activate the client via URL when the client is in the default mode
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I activate the app in default mode
    Then I assert all elements on dashboard page
    Then I activate the client with pin profile via the url
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I assert all elements on option settings view
    Then I tap about
    Then I verify profile id with "pin_profile_id"
    Then I take a screenshot

#@TC_ACTV_PRFL_0URL_018 - Revisit, Branded profile
#@TC_ACTV_PRFL_0URL_019, 020, 021 - Update scenario, revisit

@AUTO_TC_ACTV_PRFL_0URL_022 @ActivationURL @AURL22
  Scenario: I try to activate the client using the browser and verify if the client is activated
    Then I launch OM
    Given I am on welcome screen
    Then I try to activate the client using the browser
    Then I wait for 5 seconds
    Then I launch OM
    Then I verify the client to be not activated
    Then I take a screenshot

#@TC_ACTV_PRFL_0URL_023, 024 - AURL22 covers this scenario
#@TC_ACTV_PRFL_0URL_025 - Duplicate of 023

#@TC_ACTV_PRFL_0URL_026, 027, 028, 029 - Cannot automate as it involves a 3G connection

@AUTO_TC_ACTV_PRFL_0URL_030 @ActivationURL @AURL30
  Scenario: I verify the message shown, when i try to activate an already activated client
    Then I launch OM
    Given I am on dashboard screen
    Then I try to activate an already activated client
    Then I assert all elements on the activated message
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_0URL_031 @ActivationURL @AURL31
  Scenario: I verify the error message shown, when i try to activate the client with an invalid profile id
    Then I launch OM
    Given I am on welcome screen
    Then I try to activate the client with an incorrect profile id
    Then I assert all elements on the activation error message
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_0URL_032 @ActivationURL @AURL32
  Scenario: I verify the error message shown, when i try to activate the client with 
    Then I disconnect from WiFi
    Then I launch OM
    Given I am on welcome screen
    Then I try to activate the client with no internet connection
    Then I assert all elements on the internet error dialog
    Then I take a screenshot

#@AUTO_TC_ACTV_PRFL_0URL_033 - AURL32 covers this scenario

#@AUTO_TC_ACTV_PRFL_0URL_034 - Invalid scenario

@AUTO_TC_ACTV_PRFL_0URL_035 @ActivationURL @AURL35
  Scenario: I put the device to sleep while the profile is being activated, wake up and verify if the client is activated
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I put the device to sleep while activating the client via the url
    Then I assert all elements on dashboard page
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_0URL_036 @ActivationURL @AURL36
  Scenario: I try activating the client with an invalid profile and verify if the options 'Activate Later' or 'Try again' are shown
    Then I connect to IAT-PSK
    Then I launch OM
    Given I am on welcome screen
    Then I try to activate the client with an incorrect profile id
    Then I assert all elements on the activation error message
    Then I verify if the error dialog shows activate later option
    Then I take a screenshot

#@TC_ACTV_PRFL_0URL_036 - 046 - Cannot automate TC's as it requires us to validate the data on portal

#@TC_ACTV_PRFL_0URL_047 - Covered in scenario AURL30

#@TC_ACTV_PRFL_0URL_048 - 068 - Cannot automate, as it requires software to be downloaded from market

#@TC_ACTV_PRFL_0URL_069 - 072 - SQM TC's - Revisit

#@TC_ACTV_PRFL_0URL_073 - AURL001 - covers this scenario


############################
#Activation By URL#
############################

@AUTO_TC_ACTV_PRFL_0URL_001 @ActivationSlientProvisioning @ASP01
  Scenario: I activate the client via silent provisioning and verify if the client is activated
    #Then I connect to IAT-PSK
    #Then I launch OM
    Given I am on welcome screen
    Then I go back
    Then I provision the client using custom schema in silent mode
    Then I assert all elements on dashboard page
    Then I tap option settings
    Then I assert all elements on option settings view
    Then I tap about
    Then I verify profile id with "regular_profile_id"
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_0URL_004 @ActivationSlientProvisioning @ASP04
  Scenario: I try to provision the client again when the silent provisioning is in progress
    #Then I connect to IAT-PSK
    #Then I launch OM
    Given I am on welcome screen
    Then I go back
    Then I try provisioning the client again when the provisioning is in process
    Then I assert all elements on the configuration message
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_0URL_005 @ActivationSlientProvisioning @ASP05
  Scenario: I provision an already activated client and check for the behavior
    #Then I connect to IAT-PSK
    #Then I launch OM
    Given I am on welcome screen
    Then I go back
    Then I provision the client using custom schema in silent mode
    Then I assert all elements on dashboard page
    Then I provision an already activated client and verify
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_SPRO_007 @ActivationSlientProvisioning @ASP07
  Scenario: I provision the client in UI mode and verify if the client is activated
    #Then I connect to IAT-PSK
    #Then I launch OM
    Given I am on welcome screen
    Then I go back
    Then I provision the client using custom schema
    Then I tap option settings
    Then I tap about
    Then I verify profile id with "regular_profile_id"
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_SPRO_008 @ActivationSlientProvisioning @ASP08
  Scenario: I disconnect from the network while the provisioning is in place and verify the error message
    #Then I disconnect from Wi-Fi
    #Then I launch OM
    Given I am on welcome screen
    Then I go back
    Then I initiate provisioning of a client to see internet error
    Then I assert all elements on the internet error dialog
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_SPRO_009 @ActivationSlientProvisioning @ASP09
  Scenario: I try to provision a client using a invalid profile id with a valid pin and verify the error
    #Then I connect to IAT-PSK
    #Then I launch OM
    Given I am on welcome screen
    Then I go back
    Then I try to provision a client using an invalid profile id with a valid pin and verify the error
    Then I assert all elements on the invalid activation link error
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_SPRO_009_new @ActivationSlientProvisioning @ASP09_new
  Scenario: I try to provision a client using a valid profile id with an invalid pin and verify the error
    #Then I connect to IAT-PSK
    #Then I launch OM
    Given I am on welcome screen
    Then I go back
    Then I try to provision a client using an valid profile id with a invalid pin and verify the error
    Then I assert all elements on the invalid activation link error
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_SPRO_009_new1 @ActivationSlientProvisioning @ASP09_new1
  Scenario: I try to provision a client with a misconfigured clientx schema URL
    #Then I connect to IAT-PSK
    #Then I launch OM
    Given I am on welcome screen
    Then I go back
    Then I try to provision a client using a miscongfigured schema url
    Then I assert all elements on the invalid activation link error
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_SPRO_010 @ActivationSlientProvisioning @ASP10
  Scenario: I provision the client and verify if the user credentials are saved in the accounts
    #Then I connect to IAT-PSK
    #Then I launch OM
    Given I am on welcome screen
    Then I go back
    Then I provision the client using custom schema
    Then I tap option settings
    Then I tap account
    Then I verify if the credentials are saved
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_SPRO_012 @ActivationSlientProvisioning @ASP12
  Scenario: I tap ok on the provision failed message and verify the behavior
    #Then I connect to IAT-PSK
    #Then I launch OM
    Given I am on welcome screen
    Then I go back
    Then I try to provision a client using an invalid profile id with a valid pin and verify the error
    Then I assert all elements on the invalid activation link error
    Then I tap ok on the activation link error
    Then I verify if the app is launched
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_SPRO_012_new1 @ActivationSlientProvisioning @ASP12_new1
  Scenario: I try provisioning the client silently with no internet and verify the notification message
    #Then I disconnect from Wi-Fi
    #Then I launch OM
    Given I am on welcome screen
    Then I go back
    Then I initiate silent provisioning of client
    Then I assert all elements on the no internet connection notification shown while silent provisioning a client
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_SPRO_012_new2 @ActivationSlientProvisioning @ASP12_new2
  Scenario: I try provisioning the client silently with no internet and verify the notification message
    #Then I connect to IAT-PSK
    #Then I launch OM
    Given I am on welcome screen
    Then I go back
    Then I initiate silent provisioning of client
    Then I assert all elements on the successful activation notification
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_SPRO_012_new3 @ActivationSlientProvisioning @ASP12_new3
  Scenario: I silent provision a client and tap the notification to see the client being launched
    #Then I connect to IAT-PSK
    #Then I launch OM
    Given I am on welcome screen
    Then I go back
    Then I kill the client process
    Then I initiate silent provisioning of client
    Then I tap client notification from notifications view
    Then I tap lets start on travel preference view
    Then I assert all elements on dashboard page
    Then I take a screenshot

