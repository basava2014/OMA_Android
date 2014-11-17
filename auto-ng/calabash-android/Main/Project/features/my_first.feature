Feature: Activation

@AUTO_TC_ACTV_PRFL_CODE_001 @ActivationCodes @TC01
  Scenario: As a valid user Id like to validate the activation code UI
    #Then I have to see "TXT_ACCEPT"
    #When I tap "LOC_ACCEPT"
   # Then I have to see "TXT_TITLE"
   # Then I have to see "TXT_WELCOME_TITLE"
   # Then I have to see "TXAGE"
   # Then I have to see "TXT_WELCOME_GETST_WELCOME_MESSTARTED"
   # Then I have to see "TXT_WELCOME_ACTIVATIONCODE"
   # Then I have to see "TXT_WELCOME_PRIVACYPOLICY"
   # Then I have to see "TXT_WELCOME_ACTIVATELATER"
    Then I verify welcome screen
    When I tap "LOC_WELCOME_ACTIVATIONCODE"
    Then I navigate to activation code UI
    Then I have to see "TXT_ACTIVATIONCODE_PROFILE"
    Then I have to see "TXT_ACTIVATIONCODE_PIN"
    Then I have to see "TXT_ACTIVATIONCODE_EMAIL"
    Then I take a screenshot

@AUTO_TC_ACTV_PRFL_CODE_002 @ActivationCodes @TC02
  Scenario: After an Installation, I click Activation code and verify if "iPass Open Mobile" is shown on the UI
    Then I have to see "TXT_TITLE"
	When I tap "LOC_SETTINGS"
    Then I have to see "TXT_SETTINGS_SETTINGS"
    When I tap "LOC_SETTINGS_SETTINGS"
    Then I have to see "TXT_OPTION_NETWORK_TITLE"
    Then I have to see "TXT_OPTION_NETWORK_MANUAL_LOGIN"
    Then I tap "LOC_OPTION_NETWORK_MANUAL_LOGIN"
    Then I wait for 5 seconds
    Then I take a screenshot


@Test
  Scenario: Test
    Then I connect to IPASSSOA



    
