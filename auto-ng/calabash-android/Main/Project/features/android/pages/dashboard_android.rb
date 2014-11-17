
##Classes
class DashBoard
	attr_accessor :mnuTitle, :btnHotspotFinder, :btnSpeedTest, :mnuMoreOptions, :lblNetworkName, :lblNetworkStatus, :lblInRangeWiFi, 
	:btnDisconnect, :lblNetworkList, :lblHotspotList, :btnActivateMessage, :swtWifi, :btnCoach, :lblOffline, :lblNointernet, :lblInrange,
	:lblWifionoff, :btnWifi, :btnLogin

	TITLE = "iPass"
	INRANGEWIFI = "IN RANGE Wi-Fi"
	LOGOUT = "Logout"
	DISCONNECT = "Disconnect"
	LAUNCHBROWSERTOCONNECT = "Launch Browser to connect"
	ACTIVATEMESSAGE = "Tap here to activate iPass Open Mobile."
	OFFLINE = "Offline"
	NOINTERNET = "No Internet connection detected"
	WIFIONOFF = "Wi-Fi is off\nTap to turn on Wi-Fi"
    KEY = "abcde"

    LOGIN = "Login"
	CANNOTACCESSINTERNET = "This network cannot access the internet."

	PSKKEY = ConnectionHelper::PSKKEY
	OTHERKEY = ConnectionHelper::OTHERKEY
	#OTHERKEY = "abcdeabcde"

	def initialize
		@mnuTitle = CalLabel.new("* id:'action_bar_title'")
		@btnHotspotFinder = CalButton.new("* id:'action_hotspot_finder'")
		@btnSpeedTest = CalButton.new("* id:'action_speed_test'")
		@mnuMoreOptions = CalMenu.new("OverflowMenuButton")
		
		@lblNetworkName = ConnectionHelper.new.lblNetworkName
		@lblNetworkStatus = ConnectionHelper.new.lblNetworkStatus

		@lblInRangeWiFi = CalLabel.new("* id:'tv_header_inrange_wifi'")
		@btnDisconnect = ConnectionHelper.new.btnDisconnect

		@lblNetworkList = CalLabel.new("ExpandableListView * id:'text1'")
		@btnActivateMessage = CalButton.new("* id:'tv_status_bar'")
		@swtWifi = CalSwitch.new("* id:'wifi_switch'")
		@lblOffline = CalLabel.new("* id:'network_name'")
		@lblNointernet = CalLabel.new("* id:'status'")
		@lblInrange = CalLabel.new("* id:'tv_header_inrange_wifi'")
		@lblWifionoff = CalLabel.new("* id:'tv_status_inrange_networks'")
		@btnCoach = CalButton.new("* id:'action_coach_screen'")

		@btnLogin = ConnectionHelper.new.btnLogin
	end

	def pageExists
		DashBoard.new.lblInRangeWiFi.waitTillAppears
	end

	class MoreOptions
		attr_accessor :btnSendLogs, :btnDebug #:btnUsageMeter

		#USAGEMETER = "Usage Meter"
		SENDLOGS = "Send Logs"
		DEBUG = "Debug"

		def initialize
			#@btnUsageMeter = CalButton.new("TextView index:0")
			@btnSendLogs = CalButton.new("TextView index:1")
			@btnDebug = CalButton.new("TextView index:2")

			@@logger = OMLogger.getLogger(MoreOptions.name)		
		end

		def pageExists
			MoreOptions.new.btnSendLogs.waitTillAppears
		end
	end

	class OptionSettings
		attr_accessor :mnuTitle, :btnHome, :btnActivate, :btnHotspotFinder, :btnUsageMeter, :btnSpeedTest, :btnSettings, :btnHelp, :btnAbout, :itemsLength

		 TITLE = "iPass Open Mobile"
		 HOME = "Home"
		 ACTIVATE = "Activate"
		 HOTSPOTFINDER = "Hotspot Finder"
		 USAGEMETER = "Usage Meter"
		 SPEEDTEST = "Speed Test"
		 ACCOUNT = "Account"
		 SETTINGS = "Settings"
		 HELP = "Help"
		 ABOUT = "About"


		 def initialize
		 	@mnuTitle = CalLabel.new("* id:'action_bar_title'")
		 	#@btnHome = CalButton.new("ExpandableListView * id:'left_drawer' * id:'text1' index:0")
		 	@btnHome = CalButton.new("ExpandableListView * id:'left_drawer' * text:'#{Translate.new.OM_Translate("Home")}'")
		 	@btnActivate = CalButton.new("ExpandableListView * id:'left_drawer' * text:'#{Translate.new.OM_Translate("Activate")}'")
		 	@btnHotspotFinder = CalButton.new("ExpandableListView * id:'left_drawer' * text:'#{Translate.new.OM_Translate("Hotspot Finder")}'")
		 	@btnUsageMeter = CalButton.new("ExpandableListView * id:'left_drawer' * text:'#{Translate.new.OM_Translate("Usage Meter")}'")
		 	@btnSpeedTest = CalButton.new("ExpandableListView * id:'left_drawer' * text:'#{Translate.new.OM_Translate("Speed Test")}'")
		 	@btnSettings = CalButton.new("ExpandableListView * id:'left_drawer' * text:'#{Translate.new.OM_Translate("Settings")}'")
		 	@btnHelp = CalButton.new("ExpandableListView * id:'left_drawer' * text:'#{Translate.new.OM_Translate("Help")}'")
		 	@btnAbout = CalButton.new("ExpandableListView * id:'left_drawer' * text:'#{Translate.new.OM_Translate("About")}'")

		 	@@logger = OMLogger.getLogger(OptionSettings.name)
		 end

		 def pageExists
		 	OptionSettings.new.btnHome.waitTillAppears
		 end
	end

	class NetworkConnectMessage
		attr_accessor :lblTitle, :lblMessage, :btnOK, :btnCancel
        
        #TITLE = "Connect to "
		OK = "OK"
		CANCEL = "Cancel"

		def initialize
			@lblTitle = CalLabel.new("* id:'alertTitle'")
            @lblMessage = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button1'")
			@btnCancel = CalButton.new("* id:'button2'")

			@@logger = OMLogger.getLogger(NetworkConnectMessage.name)
		end

		def pageExists
			NetworkConnectMessage.new.btnCancel.waitTillAppears
		end
	end

	class BrowserLogin
		attr_accessor :lblMessage, :btnCancel, :btnOK

		MESSAGE = "You'll need to use the browser to finish connecting. Shall we continue?"
		CANCEL = "Cancel"
		OK = "OK"

		def initialize
			@lblMessage = CalLabel.new("* id:'message'")
			@btnCancel = CalButton.new("* id:'button2'")
			@btnOK = CalButton.new("* id:'button1'")
            
            @@logger = OMLogger.getLogger(BrowserLogin.name)
		end	

		def pageExists
			BrowserLogin.new.btnCancel.waitTillAppears
		end	
    end

    class AuthenticationProblem
		attr_accessor :lblTitle, :lblMessage, :btnOK

		TITLE = "Authentication Problem."
		MESSAGE1 = "This location is rejecting your username and password. If you are certain your username and password is correct, this location may not support iPass."
		MESSAGE2 = "This location is rejecting your username and password. Please make sure your username and password are correct.  If you are sure they are correct, this location may be experiencing a problem at this time."
		OK = "OK"

		def initialize
			@lblTitle = CalLabel.new("* id:'alertTitle'")
			@lblMessage = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button1'")
             
            @@loger = OMLogger.getLogger(AuthenticationProblem.name)
		end	

		def pageExists
			AuthenticationProblem.new.btnOK.waitTillAppears
		end	
	end	 

	class CompleteRegMessage
		attr_accessor :lblMessage, :btnOK

		MESSAGE = "To complete registration, please enter your account credentials."
		OK = "OK"

		def initialize
			@lblMessage = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button1'")

			@@logger = OMLogger.getLogger(CompleteRegMessage.name)
		end

		def pageExists
			CompleteRegMessage.new.btnOK.waitTillAppears
		end
	end

	class NetworkSecurityKey
		attr_accessor :lblTitle, :lblWifiPassword, :chkShowPassword, :txtWifiKey, :btnOK, :btnCancel

		WIFIPASSWORD = "Wi-Fi Password"
		SHOWPASSWORD = "Show Password"
		OK = "OK"
		CANCEL = "Cancel"

		def initialize
			@lblTitle = CalLabel.new("* id:'alertTitle'")
			#@lblWifiPassword = CalLabel.new("TextView index:1")
			@lblWifiPassword = CalLabel.new("RobotoTextView index:0")
			@chkShowPassword = CalCheckbox.new("* id:'show_passwd_lbl'")
			@txtWifiKey = CalText.new("* id:'WiFiKeyID'")
			@btnOK = CalButton.new("* id:'btnWiFiKeyOk'")
			@btnCancel = CalButton.new("* id:'btnWiFiKeyCancel'")
		end
		
		def pageExists
			NetworkSecurityKey.new.chkShowPassword.waitTillAppears
		end

	  class IncorrectWiFiPassword
		    attr_accessor :lblMessage, :btnOK

		      MESSAGE = "Incorrect Wi-Fi password"
		      OK = "OK"
         
            def initialize
        	  @lblMessage = CalLabel.new("* id:'message'")
        	  @btnOK = CalButton.new("* id:'button1'")

        	   @@logger = OMLogger.getLogger(IncorrectWiFiPassword.name)
            end

            def pageExists
			  IncorrectWiFiPassword.new.btnOK.waitTillAppears
		    end 
        end	
    end    

    class EditClearWiFiPassword
    	attr_accessor :btnEditWiFi, :btnClearWiFi

    	EDITWIFI = "Edit Wi-Fi password"
    	CLEARWIFI = "Clear Wi-Fi password"
 
        def initialize
      	   @btnEditWiFi = CalButton.new("* marked:'title' index:0")
      	   @btnClearWiFi = CalButton.new("* marked:'title' index:1")

      	 @@logger = OMLogger.getLogger(EditClearWiFiPassword.name)
        end	
      
        def pageExists
          EditClearWiFiPassword.new.btnEditWiFi.waitTillAppears
        end	
    end	
    class ClearWiFi
    	attr_accessor :lblTitle, :btnCancel, :btnOK

    	TITLE = "Clear Wi-Fi password" 
    	CANCEL = "Cancel"
    	OK = "OK"

    	def initialize
    		@lblTitle = CalLabel.new("* id:'message'")
    		@btnCancel = CalButton.new("* id:'button2'")
    		@btnOK = CalButton.new("* id:'button1'")

    		@@logger = OMLogger.getLogger(ClearWiFi.name)
    	end	
    	def pageExists
    		ClearWiFi.new.btnOK.waitTillAppears
    	end	
    end	

    class NetworkAccess
    	attr_accessor :lblMessage, :btnDisconnect, :btnLaunchbrowser

    	MESSAGE = "This network cannot access the internet. You may need to use the browser to finish connecting"
    	DISCONNECT = "Disconnect"
    	LAUNCHBROWSER = "Launch Browser"

    	def initialize
    		@lblMessage = CalLabel.new("* id:'status'")
    		@btnDisconnect = CalButton.new("* id:'button_action1'")
    		@btnLaunchbrowser = CalButton.new("* id:'button_action2'")
          
            @@logger = OMLogger.getLogger(NetworkAccess.name)
    	end
    	
    	def pageExists
    		NetworkAccess.new.btnDisconnect.waitTillAppears
    	end	
    end	
end

class DashBoardDefns
	include Calabash::Android::Operations

	def initialize
		@@logger = OMLogger.getLogger(DashBoardDefns.name)
	end

	def TapNetwork(network, longPress=false)
		networkList = "ExpandableListView * id:'text1'"
		hotspotDistance = "ExpandableListView * id:'text3'"
		
		found = false
  		count = 1
  		trySearch = 0

  		until trySearch > 1
    		arr = DashBoard.new.lblNetworkList.getElement
    		networksInList = Calx.new.GetTextFromElements(arr)

   			found = [networksInList.each].any? { |entry| entry.include? network }
   			puts "Found #{network} --> #{found}"
    		if found == true
      			if !longPress
        			tap network
        			break
      			else
        			#Long Press network
        			performAction('press_long_on_text',network)
        			break
      			end
      			sleep(2)
      			STDOUT.puts "Tapped network -- #{network}"
      ###############
    		else
      			count += 1
     			performAction('scroll_down')
     			sleep(1)
   			 end
 
    		list = DashBoard.new.lblNetworkList.getElement
    		listCurrentNetworks = Calx.new.GetTextFromElements(list)
    		puts "list --> #{list}"
    	
    		matchCount = 0
      		for item in networksInList
      			if listCurrentNetworks.include?item
      				matchCount += 1
      			end
      		end 

		    if list.include?networksInList
		      	puts "Found same network in the list, possibly reached the end of list"
		      	count.times do
		        	#puts "performing scroll_up -- #{count}"
		        	#performAction('scroll_up')
		        	perform_action('scroll_up')
		        end
		        trySearch += 1
		      	count = 0 #Rest count
		      	#puts "NewValue for trySearch --> #{trySearch}"
		    elsif matchCount === networksInList.length
		    	count.times do
        			#puts "performing scroll_up -- #{count}"
        			performAction('scroll_up')
        		end
        		trySearch += 1
		     	count = 0 #Rest count
		     	#puts "NewValue for trySearch --> #{trySearch}"
		    end
		end #Until ends

 	 	if trySearch > 1
   			raise "Could not find #{network} network"
  		end
	end
	def GetFirstNetworkFromList
		arr = DashBoard.new.lblNetworkList.getElement
    	firstNetwork = Calx.new.GetTextFromElements(arr)[0]

    	return firstNetwork
    end

    def GetAllAvailableNetworks
    	arrNetworks = []
    	res = performAction("get_list_data")["bonusInformation"][0]
    	arr = res.scan(/": \"(.*?)\(/)
    	
    	arr.each_with_index do |ele, index|
    		if arr[index][0].include?":"
    			arrNetworks.push(arr[index][0].split(": ")[1].split("\"")[1])
    		else
    			arrNetworks.push(arr[index][0])
    		end
    	end
    	puts "List of available networks --> #{arrNetworks}"
    	return arrNetworks
    end

	def getNetworksFromWlan()
     res = `adb shell dumpsys wifi | grep ESS | tr -s ' ' | awk -F "ESS]" '{print $2}' | sed 's/^[ \t]*//' | grep '^..'`
      #puts "res --> #{res}"
      arr = res.gsub(/\r\n/,',').split(',')
      #puts "arr --> #{arr}"
      return arr
    end
end

###########Steps############

Given(/^I am on dashboard screen$/) do
	@page = Base.new.Page(TravelPreference)
	res = @page.isDisplayed
	if res
		step 'I tap save on travel preference'
	else
		begin
			@page = Base.new.Page(DashBoard)
			@page.pageExists
		rescue => e
			puts e.message
			#clear_app_data
			reinstall_apps
			start_test_server_in_background
			step 'I assert and tap accept'
			sleep 2
			step 'I activate the client with regular profile id'	
		end
	end
end

Then(/^I assert all elements on dashboard page$/) do
	_Title = DashBoard::TITLE; _InRangeWiFi = DashBoard::INRANGEWIFI;
	h = {_Title => @page.mnuTitle.getText(), _InRangeWiFi => @page.lblInRangeWiFi.getText()}
	Calx.new.AssertTextAll(h)
	begin
		@page.btnHotspotFinder.waitTillAppears
		@page.btnSpeedTest.waitTillAppears
	rescue => e
	end
end

Then(/^I assert all elements on the more options view$/) do
	_SendLogs = DashBoard::MoreOptions::SENDLOGS; _Debug = DashBoard::MoreOptions::DEBUG
	h = {_SendLogs => @page.btnSendLogs.getText(), _Debug => @page.btnDebug.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/I tap hotspot finder to see hotspot finder page/) do
	count = 30; timeout	= 0
	
	while timeout < count
		res = @page.lblNetworkStatus.getText.include?"Online"  #Confirm if the client is connected as this may lead to incorrect results
		if res
			break
		else
			sleep 1
			timeout = timeout+1
		end
	end
	if count === timeout
		raise "Client is not online"
	end

	@page.btnHotspotFinder.tap()
	@page = Base.new.Page(HotspotFinder)
	@page.pageExists()
end

Then(/I tap hotspot finder to see offline mode message/) do
	@page.btnHotspotFinder.tap()
	@page = Base.new.Page(HotspotFinder::OfflineModeMessage)
	@page.pageExists()
end

Then(/^I tap hotspot finder to see enable GPS message$/) do
	@page.btnHotspotFinder.tap()
	@page = Base.new.Page(HotspotFinder::GPSOffMessage)
	@page.pageExists()
end

Then(/^I tap hotspot finder to see no hotspot date error$/) do
	@page.btnHotspotFinder.tap()
	@page = Base.new.Page(HotspotFinder::NoHotspotData)
	@page.pageExists
end

Then(/I tap activate message on dashboard/) do
	@page.btnActivateMessage.tap()
	@page = Base.new.Page(Welcome)
	@page.pageExists
end

Then(/^I have to see main dashboard$/) do
	sleep 2
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end

Then(/^I tap networks section$/) do
	@page.btnTapMessage.tap()
	@page = Base.new.Page()
	@page.pageExists
end

######## Option Settings ##########

Then(/^I tap settings$/) do
	@page.btnSettings.tap()
	@page = Base.new.Page(OptionNetwork)
	@page.pageExists
end

Then(/^I tap option settings$/) do
	@page.mnuTitle.tap()
	@page = Base.new.Page(DashBoard::OptionSettings)
	@page.pageExists()
end

Then(/^I set the network name as "([^\"]*)"$/) do |arg|
	@network = arg
end

Then(/^I assert all elements on option settings view$/) do
	sleep 2
	_Title = DashBoard::OptionSettings::TITLE; _Home = DashBoard::OptionSettings::HOME; _HotspotFinder = DashBoard::OptionSettings::HOTSPOTFINDER; 
	_UsageMeter = DashBoard::OptionSettings::USAGEMETER; _SpeedTest = DashBoard::OptionSettings::SPEEDTEST; _Settings = DashBoard::OptionSettings::SETTINGS; 
	_Help = DashBoard::OptionSettings::HELP; _About = DashBoard::OptionSettings::ABOUT;

	h = {_Title => @page.mnuTitle.getText(), _Home => @page.btnHome.getText(), _HotspotFinder => @page.btnHotspotFinder.getText(),
		_UsageMeter => @page.btnUsageMeter.getText(), _SpeedTest => @page.btnSpeedTest.getText(), _Settings => @page.btnSettings.getText(), _Help => @page.btnHelp.getText(),
		_About => @page.btnAbout.getText()}
		#performAction('drag',1,1,75,65,1)
		Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on option settings view when client is not activated$/) do
	sleep 2
	_Title = DashBoard::OptionSettings::TITLE; _Home = DashBoard::OptionSettings::HOME; _Activate = DashBoard::OptionSettings::ACTIVATE; _HotspotFinder = DashBoard::OptionSettings::HOTSPOTFINDER; 
	_UsageMeter = DashBoard::OptionSettings::USAGEMETER; _SpeedTest = DashBoard::OptionSettings::SPEEDTEST; _Help = DashBoard::OptionSettings::HELP; 
	_About = DashBoard::OptionSettings::ABOUT;
	
	h = {_Title => @page.mnuTitle.getText(), _Home => @page.btnHome.getText(), _Activate => @page.btnActivate.getText ,_HotspotFinder => @page.btnHotspotFinder.getText(),
		_UsageMeter => @page.btnUsageMeter.getText(), _SpeedTest => @page.btnSpeedTest.getText(), _Help => @page.btnHelp.getText(),
		_About => @page.btnAbout.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap about$/) do
	3.times do
		if !@page.btnAbout.isElementPresent
			puts "Couldn't see about option"
			performAction('drag',1,1,75,65,1)
			sleep 2
		else
			puts "Found about option"
			break
		end
	end
	@page.btnAbout.tap()
	@page = Base.new.Page(About)
	@page.pageExists
end

Then(/^I tap activate$/) do
	@page.btnActivate.tap()
	@page = Base.new.Page(Welcome)
	@page.pageExists
end

Then(/^I tap help$/) do
	@page.btnHelp.tap()
	@page = Base.new.Page(Help)
	@page.pageExists
end	

Then(/^I tap speed test$/) do
	@page.btnSpeedTest.tap()
	@page = Base.new.Page(SpeedTest::SpeedTestStart)
	@page.pageExists
end

Then(/^I tap usage meter$/) do
	@page.btnUsageMeter.tap()
	@page = Base.new.Page(DataUsagePanel::UsageMeter)
	@page.pageExists
end

Then(/^I assert all elements on the wifi security key view$/) do
    @page = Base.new.Page(DashBoard::NetworkSecurityKey)
	_WifiPassword = DashBoard::NetworkSecurityKey::WIFIPASSWORD; _ShowPassword = DashBoard::NetworkSecurityKey::SHOWPASSWORD;
	_Ok = DashBoard::NetworkSecurityKey::OK; _Cancel = DashBoard::NetworkSecurityKey::CANCEL

	#puts "@page.lblWifiPassword.getText --> #{@page.lblWifiPassword.getText}"
	#puts "#{_WifiPassword#} === #{@page.lblWifiPassword.getText}"

	h = {_WifiPassword => @page.lblWifiPassword.getText, _ShowPassword => @page.chkShowPassword.getText, _Ok => @page.btnOK.getText,
	 	_Cancel => @page.btnCancel.getText}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap ok on the confirmation message$/) do
	@page.btnOK.tap()
	@page = Base.new.Page(DashBoard::CompleteRegMessage)
	@page.pageExists
end

Then(/^I assert all elements on the complete registration message$/) do
	@page = Base.new.Page(DashBoard::CompleteRegMessage)
	_Message = DashBoard::CompleteRegMessage::MESSAGE; _OK = DashBoard::CompleteRegMessage::OK
	h = {_Message => @page.lblMessage.getText, _OK => @page.btnOK.getText}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap ok on the complete registration message$/) do
	@page.btnOK.tap()
	@page = Base.new.Page(Account)
	@page.pageExists
end

Then(/^I tap "([^\"]*)" network$/) do |network|
	@network = network
	DashBoardDefns.new.TapNetwork(network, false)
	@page = Base.new.Page(DashBoard::CompleteRegMessage)
	@page.pageExists
end

Then(/^I long press "([^\"]*)" network$/) do |network|
	@network = network
  	DashBoardDefns.new.TapNetwork(network,true)
  	@page = Base.new.Page(DashBoard::EditClearWiFiPassword)
  	@page.pageExists
end

Then(/^I enter security key and tap ok$/) do
	if @page.lblTitle.getText.include?"PSK"
		key = DashBoard::PSKKEY
	else
		key = DashBoard::OTHERKEY
	end
	@page.txtWifiKey.set(key)
	@page.btnOK.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end

##################
###########
#CONNECTIVITY TC'S
#############################
Then(/^I enter incorrect security key and tap ok$/) do
	password = DashBoard::KEY
	@page.txtWifiKey.set(password)
	@page.btnOK.tap()
	begin
		@page = Base.new.Page(DashBoard::NetworkSecurityKey::IncorrectWiFiPassword)
		@page.pageExists
		step 'I assert all elements in incorrectwifipassword view'
	    @page.btnOK.tap()
	    @page = Base.new.Page(DashBoard::NetworkSecurityKey)
	    @page.pageExists
	rescue => e
		puts e.message
	end
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end

Then(/^I assert all elements in incorrectwifipassword view$/) do
	 _Message = DashBoard::NetworkSecurityKey::IncorrectWiFiPassword::MESSAGE; _Ok = DashBoard::NetworkSecurityKey::IncorrectWiFiPassword::OK

	 h = {_Message => @page.lblMessage.getText(), _Ok => @page.btnOK.getText()}
     Calx.new.AssertTextAll(h)
end	

Then(/^I see the ok button disabled when the field left blank in networksecuritykey view$/) do
	res = @page.btnOK.isEnabled()
	if !res
    puts "Button is Disabled"
    end
end

Then(/^I assert all elements on editclearwifipassword view$/) do
	 _Editwifi = DashBoard::EditClearWiFiPassword::EDITWIFI; _Clearwifi = DashBoard::EditClearWiFiPassword::CLEARWIFI

     h = {_Editwifi => @page.btnEditWiFi.getText(), _Clearwifi => @page.btnClearWiFi.getText()}
	 Calx.new.AssertTextAll(h)
end	

Then(/^I assert all elements in clear wifi view$/) do
	 _Title = DashBoard::ClearWiFi::TITLE; _Cancel = DashBoard::ClearWiFi::CANCEL; _Ok = DashBoard::ClearWiFi::OK
	 h = {_Title => @page.lblTitle.getText(), _Cancel => @page.btnCancel.getText(), _Ok => @page.btnOK.getText()}
	 Calx.new.AssertTextAll(h)
end

Then(/^I tap clear Wi-Fi password$/) do
	@page.btnClearWiFi.tap()
	@page = Base.new.Page(DashBoard::ClearWiFi)
	@page.pageExists()
end	

Then(/^I tap ok on clear Wi-Fi view$/) do
	@page.btnOK.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists()
end

Then(/^I clear password for network "([^\"]*)"$/) do |network|
    @network = network
	DashBoardDefns.new.TapNetwork(network,true)
  	@page = Base.new.Page(DashBoard::EditClearWiFiPassword)
  	@page.pageExists
  	macro 'I assert all elements on editclearwifipassword view'
  	macro 'I tap clear Wi-Fi password'
  	macro 'I assert all elements in clear wifi view'
  	macro 'I tap ok on clear Wi-Fi view'
end	

Then(/^I tap network "([^\"]*)" from network list$/) do |network|
	@network = network
	DashBoardDefns.new.TapNetwork(network, false)
	@page = Base.new.Page(Account)
	@page.pageExists
end
##################################

Then(/^I assert elements on the connected network$/) do
	count = 0; timeout = 20;
	while count < timeout
		status = @page.btnDisconnect.getText
		if status.include?DashBoard::DISCONNECT
			break
		else
			sleep 1
		end
		count += 1
	end
	_Disconnect = DashBoard::DISCONNECT

	h = {@network => @page.lblNetworkName.getText(), _Disconnect => @page.btnDisconnect.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert elements on the connected non ipass network$/) do
	step 'I wait for 12 seconds'
	h = {@network => @page.lblNetworkName.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on browser login page$/) do
    @page = Base.new.Page(DashBoard::BrowserLogin) 
     sleep 12     
	_Message = DashBoard::BrowserLogin::MESSAGE; _Cancel = DashBoard::BrowserLogin::CANCEL; _Ok = DashBoard::BrowserLogin::OK 

	h = {_Message => @page.lblMessage.getText(), _Cancel => @page.btnCancel.getText(), _Ok => @page.btnOK.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap cancel on browser login page$/) do
	@page.btnCancel.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end

###To connect Browser Based Network##########

Then(/^I tap the "([^\"]*)" network$/) do |network|
	@network = network
	DashBoardDefns.new.TapNetwork(network, false)
	sleep 12
	@page = Base.new.Page(DashBoard::BrowserLogin)
	@page.pageExists
end

Then(/^I tap "([^\"]*)" network from the networklist and check authentication$/) do |network|
	@network = network
	DashBoardDefns.new.TapNetwork(network, false)
	@page = Base.new.Page(DashBoard::AuthenticationProblem)
	@page.pageExists
end

Then(/^I assert all elements on authentication problem page$/) do
	_Title = DashBoard::AuthenticationProblem::TITLE; _Message1 = DashBoard::AuthenticationProblem::MESSAGE1; _Ok = DashBoard::AuthenticationProblem::OK
	_Message2 = DashBoard::AuthenticationProblem::MESSAGE2;

	a = {_Title => @page.lblTitle.getText(), _Ok => @page.btnOK.getText()}
	b = {_Message1 => @page.lblMessage.getText}
	c = {_Message2 => @page.lblMessage.getText}
	begin
		h = a.merge(b)
		Calx.new.AssertTextAll(h)
	rescue => e
		h = {}
		h = a.merge(c)
		Calx.new.AssertTextAll(h)
	end
end

Then(/^I tap ok on authentication problem view$/) do
	@page.btnOK.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end

Then(/^I assert all elements in network access page when connected to browser based network$/) do
	@page = Base.new.Page(DashBoard::NetworkAccess)
	_Message = DashBoard::NetworkAccess::MESSAGE; _Disconnect = DashBoard::NetworkAccess::DISCONNECT; _Browser = DashBoard::NetworkAccess::LAUNCHBROWSER
	
	h = {_Message => @page.lblMessage.getText(), _Disconnect => @page.btnDisconnect.getText(), _Browser => @page.btnLaunchbrowser.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap disconnect on network access view$/) do
	@page = Base.new.Page(DashBoard::NetworkAccess)
	@page.btnDisconnect.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end

Then(/^I assert all elements on network connect view$/) do
    @page = Base.new.Page(DashBoard::NetworkConnectMessage)
	_Ok = DashBoard::NetworkConnectMessage::OK; _Cancel = DashBoard::NetworkConnectMessage::CANCEL
    
	h = {_Ok => @page.btnOK.getText(), _Cancel => @page.btnCancel.getText()}
	Calx.new.AssertTextAll(h)	
end

Then(/^I tap ok on network connect message view$/) do
	@page.btnOK.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end
Then(/^I tap "([^\"]*)" network to see network connect view$/) do |network|
	@network = network
	DashBoardDefns.new.TapNetwork(network, false)
	@page = Base.new.Page(DashBoard::NetworkConnectMessage)
	@page.pageExists
end

Then(/^I tap cancel on network connect message view$/) do
	@page.btnCancel.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end

Then(/^I tap network "([^\"]*)" to connect after credentials are saved$/) do |network|
	@network = network
	DashBoardDefns.new.TapNetwork(network, false)
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end

Then(/^I tap "([^\"]*)" network to connect$/) do |network|
	@network = network
	DashBoardDefns.new.TapNetwork(network, false)
	@page = Base.new.Page(DashBoard::NetworkSecurityKey)
	@page.pageExists
end

Then(/^I assert all elements in dashboard network panel when wifi is off$/) do 
	_Offline = DashBoard::OFFLINE; _Nointernet = DashBoard::NOINTERNET; _Inrange = DashBoard::INRANGEWIFI;
	_Wifionoff = DashBoard::WIFIONOFF

	h = {_Offline => @page.lblOffline.getText(), _Nointernet => @page.lblNointernet.getText(), 
		_Inrange => @page.lblInRangeWiFi.getText(), _Wifionoff => @page.lblWifionoff.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert the elements when wifi enabled but not connected in dashboardnetworkpanel$/) do
	_Offline = DashBoard::OFFLINE; _Nointernet = DashBoard::NOINTERNET; _Inrange = DashBoard::INRANGEWIFI;
	
	h = {_Offline => @page.lblOffline.getText(), _Nointernet => @page.lblNointernet.getText(), _Inrange => @page.lblInRangeWiFi.getText()}
	Calx.new.AssertTextAll(h)
end

####SpecialNetworkHandling####

Then(/^I see "([^\"]*)" on the connection status and top of the networks section$/) do |network|
	 @network = network
	 res = @page.lblNetworkName.getElement
	 puts res
     @page = Calx.new.GetTextFromElements(res)[0]
    if @page === network
     puts "Pass"
     else 
     raise "Fail"
    end	
end	
Then(/^I see the network "([^\"]*)" is available on top of the network list$/) do |network|
	 @network = network
     DashBoardDefns.new.GetFirstNetworkFromList()
	 @page = Base.new.Page(DashBoard)
	 @page.pageExists
end

Then(/^I see if the network "([^\"]*)" is available in wlan$/) do |network|
  arr = DashBoardDefns.new.getNetworksFromWlan()
  if arr.include?network
    puts "Found #{network} in the native client"
  else
    raise "Couldn't find network in the native client"
  end
end

Then(/^I should not see prohibited network "([^\"]*)"$/) do |arg1|
     networkList = DashBoardDefns.new.GetAllAvailableNetworks()
     if !networkList.include?arg1
        puts "Couldn't not find probhibited network in the network list"
     else
        raise "Found probhibited network in the network list"
     end
end
Then(/^I may or may not see the "([^\"]*)" network on top of the list$/) do |network|

	 @network = network
     res = DashBoardDefns.new.GetFirstNetworkFromList()
	 @page = Base.new.Page(DashBoard)
	 @page.pageExists

    if res != network
      	puts "Couldn't find the network on top of the list"

    end
end

##################################################
 #NetworkList_General
 #################################################	
Then(/^I get all Wi-Fi networks$/) do
	DashBoardDefns.new.GetAllAvailableNetworks()
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end 

Then(/^I see the wifi button exists in dashboard network panel$/) do
    step 'I disable Wi-Fi'
    sleep 3
	@page.swtWifi.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end