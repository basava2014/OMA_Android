#Classes

class OptionNetwork
	attr_accessor :btnManualLogin, :lblNetworkTitle, :btnNotifications, :lblNotificationsMessage, :lblManualLoginMessage, :lblTitle, :btnAutoConnect, :lblAutoConnMessage,
	:btnTravelPreferences, :lblTravelPreferences, :btnAccountDetails, :lblAccountDetails
	              
	#:btnTitle, :lblMessage, :lblNetworkMessage, :btnAddnew, :btnSave, :btnCancel
    TITLE = "Settings"
	NETWORKTITLE = "NETWORK"
	AUTOCONNECT = "AutoConnect"
	AUTOCONNMESSAGE = "Automatically connect to iPass networks when available"
 	NOTIFICATIONS = "Notifications"
 	NOTIFICATIONMESSAGE = "Notify me when iPass networks are nearby"
 	MANUALLOGIN = "Connection Preferences"
 	MANUALLOGINMESSAGE = "Select your favorite networks so we always connect to them over other available networks and exclude networks you want us to ignore."
 	TRAVELPREFERENCES = "Travel Preferences"
 	TRAVELPREFERENCES_MESSAGE = "Tell us where you travel and we will get smarter about connecting you in those regions."
 	ACCOUNTDETAILS = "Account Details"
 	ACCOUNTDETAILS_MESSAGE = "Enter your account information and we will log you into iPass-enabled hotspots."

	 def initialize
	 	@lblTitle = CalLabel.new("* id:'action_bar_title'")
 		@lblNetworkTitle = CalLabel.new("* id:'title' index:0")
 		@btnAutoConnect = CalButton.new("* id:'title' index:4")
	 	@lblAutoConnMessage = CalLabel.new("* id:'summary' index:3")
 		@btnNotifications = CalButton.new("* id:'title' index:5")
 		@lblNotificationsMessage = CalLabel.new("* id:'summary' index:4")
 		@btnManualLogin = CalButton.new("* id:'title' index:3")
 		@lblManualLoginMessage = CalLabel.new("* id:'summary' index:2")
 		@btnTravelPreferences = CalButton.new("* id:'title' index:2")
 		@lblTravelPreferences = CalLabel.new("* id:'summary' index:1")
 		@btnAccountDetails = CalButton.new("* id:'title' index:1")
 		@lblAccountDetails = CalLabel.new("* id:'summary' index:0")

 		@@logger = OMLogger.getLogger(OptionNetwork.name)
 	end

 	def pageExists
		OptionNetwork.new.lblNetworkTitle.waitTillAppears()
 	end

end


###############################################################
#Step_Definations
###############################################################

Then(/^I tap account$/) do
	begin
		step 'I tap settings'
	rescue => e
	end
	3.times do
		if !@page.btnAccountDetails.isElementPresent
			puts "Couldn't see account option"
			performAction('scroll_down')
			sleep 2
		else
			puts "Found account option"
			break
		end
	end
	@page.btnAccountDetails.tap
	@page = Base.new.Page(Account)
	@page.pageExists
end

Then(/^I tap download hotspot lists$/) do
	@page.btnTravelPreferences.tap
	@page = Base.new.Page(DownloadHotspotLists)
	@page.pageExists
end

Then(/^I assert all elements on OptionNetwork UI$/) do
 	_Title = OptionNetwork::TITLE; _Networktitle = OptionNetwork::NETWORKTITLE; _Notifications = OptionNetwork::NOTIFICATIONS; _Notificationmessage = OptionNetwork::NOTIFICATIONMESSAGE; 
  	_AutoConnect = OptionNetwork::AUTOCONNECT; _AutoConnMessage = OptionNetwork::AUTOCONNMESSAGE; _ManualLogin =  OptionNetwork::MANUALLOGIN; _ManualLoginMessage = OptionNetwork::MANUALLOGINMESSAGE;
 	_TravelPreferences = OptionNetwork::TRAVELPREFERENCES; _TravelPreferences_Message = OptionNetwork::TRAVELPREFERENCES_MESSAGE; _AccountDetails = OptionNetwork::ACCOUNTDETAILS;
  	_AccountDetails_Message = OptionNetwork::ACCOUNTDETAILS_MESSAGE;

	a = {_Title => @page.lblTitle.getText(), _AutoConnect => @page.btnAutoConnect.getText(), _AutoConnMessage => @page.lblAutoConnMessage.getText(), 
		_Networktitle => @page.lblNetworkTitle.getText(), _Notifications => @page.btnNotifications.getText(), _ManualLogin => @page.btnManualLogin.getText(),
   		_Notificationmessage => @page.lblNotificationsMessage.getText(), _ManualLoginMessage => @page.lblManualLoginMessage.getText()}
    performAction('scroll_down')
	b = {_TravelPreferences => @page.btnTravelPreferences.getText,
    	_TravelPreferences_Message => @page.lblTravelPreferences.getText, _AccountDetails => @page.btnAccountDetails.getText, _AccountDetails_Message => @page.lblAccountDetails.getText}
	h = a.merge(b)
	Calx.new.AssertTextAll(h)
end

Then(/^I tap manual login$/) do
	@page.btnManualLogin.tap()
	@page = Base.new.Page(ManualLogin)
	@page.pageExists
end

