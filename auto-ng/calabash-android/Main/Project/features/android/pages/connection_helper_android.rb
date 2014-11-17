
#Connection Helpers
class ConnectionHelper
	attr_accessor :lblNetworkName, :lblNetworkStatus, :btnDisconnect, :btnLogin
	@@ssid = ""
	
	LOGOUT = "Logout"
	DISCONNECT = "Disconnect"
	LAUNCHBROWSERTOCONNECT = "Launch Browser to connect"
	OFFLINE = "Offline"
	NOINTERNET = "No Internet connection detected"
	LOGIN = "Login"
	CANNOTACCESSINTERNET = "This network cannot access the internet."

	PSKKEY = "QAWPAKEY"
	#OTHERKEY = "09876543210987654321fedcba"
	OTHERKEY = "Tim3Pa55"

	def initialize
		@lblNetworkName = CalLabel.new("* id:'network_name'")
		@lblNetworkStatus = CalLabel.new("* id:'status'")
		@btnDisconnect = CalButton.new("* id:'button_action1'")
		@btnLogin = CalButton.new("* id:'button_action2'")

		@@logger = OMLogger.getLogger(ConnectionHelper.name)
	end

	def WaitForNetworkToConnect
		timeout = 30; count = 0;
		while count < timeout
			if (ConnectionHelper.new.lblNetworkStatus.getText.include?"Online") || (ConnectionHelper.new.btnDisconnect.isElementPresent)
				STDOUT.puts "Client UI shows network connected"
				break
			else
				sleep 1
				count += 1
			end
		end
		raise "Timeout waiting for network to connect" if count >= timeout	
	end

	def Connector(networkType, name)
		@@ssid = name.strip
		STDOUT.puts "SSID ---> #{@@ssid}"
		if @@ssid.nil?
			raise
		end		
		case networkType.strip
		when "GIS"
			GIS_Helper()
		when /WEP|WPA|WPA2/
			SharedKey_Helper()
		when "GC"
			GC_Helper()
		when "GC.1"
			GC_1_Helper()
		when "DS.1"
			DS_1_Helper()
		when "BL"
			BL_Helper()
		when /^CUSTOM/ 
			CUSTOM_Network_Helper()
		else
			@@logger.fatal("Couldn't find a matching network type for- #{@networkType}")
		end
	end

	def GIS_Helper
		WaitForNetworkToConnect()
		h = {@@ssid => @lblNetworkName.getText, DISCONNECT => @lblDisconnect.getText}
		if !Support.new.IsConnected()
			@@logger.fatal("SNIFF Test Failed!")
		end
		Calx.new.AssertTextAll(h)
		if @btnLogin.isElementPresent
			@@logger.fatal("Found login button, looks like the client isn't connected")
		end
	end

	def SharedKey_Helper
		#Handles networks which are WEP, WPA, WPA2
		WaitForNetworkToConnect()
		puts "@@ssid --> #{@@ssid}"
		puts "@lblNetworkName --> #{@lblNetworkName}"
		h = {@@ssid => @lblNetworkName.getText}
		if !Support.new.IsConnected()
			@@logger.fatal("SNIFF Test Failed!")
		end
		Calx.new.AssertTextAll(h)
	end

	def GC_Helper
	end

	def GC_1_Helper
	end 

	def DS_1_Helper 
	end

	def BL_Helper 
	end

	def CUSTOM_Network_Helper
	end

	def NOIP_Helper
	end

end

## Step Defns

Then(/^I connect to \"([^\"]*)\" network with SSID \"([^\"]*)\"$/) do |networktype, ssid|
	step 'I clear account settings'
	step %Q[I tap "#{ssid}" network]
	step 'I assert all elements on the complete registration message'
	step 'I tap ok on the complete registration message'
	step 'I assert all elements on the account view'
	step 'I enter OM credentials'
	if networktype.include?"W"
		STDOUT.puts "Got a pre-shared key network"
		step 'I tap save to see wifi security view'
		step 'I assert all elements on the wifi security key view'
		step 'I enter security key and tap ok'
	else
		step 'I tap save to see dashboard'
	end
	ConnectionHelper.new.Connector(networktype, ssid)
end

Then(/^I should see an \"([^\"]*)\" in case of a failure$/) do |error|
	#Call connection helper here
	if !(error === "NA")
		#Handle errors here
	end
end