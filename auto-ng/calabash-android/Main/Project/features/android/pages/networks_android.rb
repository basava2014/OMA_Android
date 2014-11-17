
##Class
class NetworksView
	attr_accessor :lblAppName, :lblConnStatus, :lblActiveNetwork, :lblConnectedSince, :lblNetworkName, :lblWifiState

	def initialize
		@lblAppName = CalLabel.new("* id:'app_name'")
		@lblConnStatus = CalLabel.new("* id:'connstatus'")
		@lblActiveNetwork = CalLabel.new("* id:'network_name'")
		@lblConnectedSince = CalLabel.new("* id:'connected_since'")
		@lblNetworkName = CalLabel.new("* id:'label'")
		@lblWifiState = CalLabel.new("* id:'wifi_state'")

		@@logger = OMLogger.getLogger(NetworksView.name)
	end

	def pageExists
		NetworksView.lblConnStatus.waitTillAppears()
	end

end


## class defns
class NetworksViewDefns
end

## STEPS ##



