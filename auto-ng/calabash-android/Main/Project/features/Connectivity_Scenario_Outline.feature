Feature: Connectivity TC's - All modes

@ConnectTC's
Scenario Outline: Connectivity
  #Then I disconnect from Wi-Fi
	Given I am on dashboard screen
	Then I connect to "<NetworkType>" network with SSID "<SSID>"
	Then I should see an "<Error>" in case of a failure
	Then I take a screenshot

 Examples:
      |   NetworkType   |      SSID     | Error |           
      |     GI          |     ibahn     |  NA   |
      |     WEP         |     IAT_WEP   |  NA   |
      |     WPA         |     IAT-PSK   |  NA   |
      |     WPA2        |     IAT-PSK   |  NA   |
      |     GC          |     GO GO     |  NA   |
      |     GC.1        |     LUFT      |  NA   |
      |     DS.1        |    att wifi   |  NA   |
      |     BL          |    iPassSOA   |  NA   |
      |     CUSTOM_GIS  |    IAT-GIS    |  NA   |
      |     CUSTOM_WEP  |    IAT-WEP    |  NA   |
      |     CUSTOM_WPA  |    IAT-PSK    |  NA   |
      |     CUSTOM_WPA2 |    IAT-PSK    |  NA   |
      |     NOIP        |    IAT-NOIP   | NO IP |