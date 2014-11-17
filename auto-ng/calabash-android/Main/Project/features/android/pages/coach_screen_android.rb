##Class
class CoachScreen
	attr_accessor :lblSideDrawer, :lblConnectionStatus, :lblHotspotFinder, :lblSpeedTest, :lblUsageMeter, :lblHighConfidenceNetworks, :lblLowConfidenceNetworks,
	:lblSignalStrength, :lblHowDoIConnect, :lblHowToConnect_Answer, :btnClose

	SIDEDRAWER = "Side Drawer"
	CONNECTIONSTATUS = "Connection Status"
	HOTSPOTFINDER = "Hotspot Finder"
	SPEEDTEST = "Speed Test"
	USAGEMETER = "Usage Meter"
	HIGHCONFIDENCENETWORKS = "High Confidence Networks"
	LOWCONFIDENCENETWORKS = "Low Confidence Networks"
	SIGNALSTRENGTH = "Signal Strength"
	HOWDOICONNECT = "HOW DO I CONNECT?"
	HOWTOCONNECT_ANSWER = "Tap on Network name or signal strength to connect or disconnect from the network."
	CLOSE = "Close"

	def initialize
		@lblSideDrawer = CalLabel.new("* id:'textView4'")
		@lblConnectionStatus = CalLabel.new("* id:'textView5'")
		@lblHotspotFinder = CalLabel.new("* id:'textView8'")
		@lblSpeedTest = CalLabel.new("* id:'textView7'")
		@lblUsageMeter = CalLabel.new("* id:'textView6'")
		@lblHighConfidenceNetworks = CalLabel.new("* id:'textView2'")
		@lblLowConfidenceNetworks = CalLabel.new("* id:'textView3'")
		@lblSignalStrength = CalLabel.new("* id:'textView1'")
		@lblHowDoIConnect = CalLabel.new("* id:'que_how_do_i_connect'")
		@lblHowToConnect_Answer = CalLabel.new("* id:'ans_how_to_connet'")
		@btnClose = CalButton.new("* id:'close_button'")
	end

	def pageExists
		CoachScreen.new.btnClose.waitTillAppears
	end
end


##Class Defns
class CoachScreenDefns
end

##Step Defns
Then(/^I assert all elements on coach screen view$/) do
	_SideDrawer = CoachScreen::SIDEDRAWER; _ConnectionStatus = CoachScreen::CONNECTIONSTATUS; _HotspotFinder = CoachScreen::HOTSPOTFINDER; _SpeedTest = CoachScreen::SPEEDTEST;
	_UsageMeter = CoachScreen::USAGEMETER; _HighConfidenceNetworks = CoachScreen::HIGHCONFIDENCENETWORKS; _LowConfidenceNetworks = CoachScreen::LOWCONFIDENCENETWORKS; _SignalStrength = CoachScreen::SIGNALSTRENGTH;
	_HowDoIConnect = CoachScreen::HOWDOICONNECT; _HowToConnectAnswer = CoachScreen::HOWTOCONNECT_ANSWER; _Close = CoachScreen::CLOSE

	h = {_SideDrawer => @page.lblSideDrawer.getText, _ConnectionStatus => @page.lblConnectionStatus.getText, _HotspotFinder => @page.lblHotspotFinder.getText.gsub(/\n/,' '),
		_SpeedTest => @page.lblSpeedTest.getText.gsub(/\n/,' '), _UsageMeter => @page.lblUsageMeter.getText.gsub(/\n/,' '), _HighConfidenceNetworks => @page.lblHighConfidenceNetworks.getText, _LowConfidenceNetworks => @page.lblLowConfidenceNetworks.getText,
		_SignalStrength => @page.lblSignalStrength.getText.gsub(/\n/,' '), _HowDoIConnect => @page.lblHowDoIConnect.getText, _HowToConnectAnswer => @page.lblHowToConnect_Answer.getText,
		_Close => @page.btnClose.getText}
		Calx.new.AssertTextAll(h)	
end

Then(/^I tap close$/) do
	@page.btnClose.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end