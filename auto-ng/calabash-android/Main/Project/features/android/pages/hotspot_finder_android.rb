require 'json'
require 'nokogiri'
#require_relative '../../lib/ldogger.rb'
#require_relative '../../lib/common.rb'

######Class#######

class HotspotFinder
	attr_accessor :lblTitle, :btnMap, :txtSearch, :btnFilter, :txtCity, :btnNearby, :lblSSID, :lblSiteName, :lblDistance, :lblAddress, :lblHostpotList

	TITLE = "Hotspot Finder"
	CITY = "Current Location"

	def initialize
		@lblTitle = CalLabel.new("* id:'action_bar_title'")
		@btnMap = CalButton.new("* id:'action_map'")
		@txtSearch = CalText.new("* id:'search_bar_id'")
		@btnFilter = CalButton.new("* id:'filter_button_id'")
		@txtCity = CalButton.new("* id:'city_edittext_id'")
		@btnNearby = CalButton.new("* id:'nearby_button_id'")
		@lblSSID = CalLabel.new("* id:'ssid'")
		@lblSiteName = CalLabel.new("* id:'siteName'")
		@lblDistance = CalLabel.new("* id:'distance'")
		@lblAddress = CalLabel.new("* id:'address'")
		@lblHostpotList = CalLabel.new("* id:'list' RobotoTextView")

		@@logger = OMLogger.getLogger(HotspotFinder.name)
	end

	def pageExists
		HotspotFinder.new.txtSearch.waitTillAppears()
	end

	class OfflineModeMessage
		attr_accessor :lblMessage, :btnOK

		MESSAGE = "When you're online, tap the gear icon on the dashboard and then tap Download Hotspot Lists > Download so we can find hotspots in offline mode."
		BUTTON = "OK"

		def initialize
			@lblMessage = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button2'")

			@@logger = OMLogger.getLogger(HotspotFinder::OfflineModeMessage.name)
		end

		def pageExists
			OfflineModeMessage.new.btnOK.waitTillAppears()
		end
	end

	class MapView
		attr_accessor :txtSearch, :btnFilter, :btnBackToListView

		def initialize
			@txtSearch = CalText.new("* id:'city_edittext_id'")
			@btnFilter = CalButton.new("* id:'filter_button_id'")
			@btnBackToListView = CalButton.new("* id:'action_list'")

			@@logger = OMLogger.getLogger(MapView.name)
		end

		def pageExists
			MapView.new.btnBackToListView.waitTillAppears()
		end
	end

	class SearchView
		attr_accessor :btnHotel, :btnRestaurant, :btnAirport, :btnOthers, :lblFind, :txtFind, :lblNear, :txtNear, :btnSearch

		FIND = "Find:"
		NEAR = "Near:"
		SEARCH = "Search"

		def initialize
			@btnHotel = CalButton.new("* id:'toggle_hotel'")
			@btnRestaurant = CalButton.new("* id:'toggle_restaurant'")
			@btnAirport = CalButton.new("* id:'toggle_airport'")
			@btnOthers = CalButton.new("* id:'toggle_other'")
			@lblFind = CalLabel.new("* id:'tv_find'")
			@txtFind = CalText.new("* id:'et_keyword'")
			@lblNear = CalLabel.new("* id:'tv_near'")
			@txtNear = CalText.new("* id:'et_near'")
			@btnSearch = CalButton.new("* id:'search_button'")
		end

		def pageExists
			SearchView.new.btnHotel.waitTillAppears()
		end
	end

	class HotspotData
		attr_accessor :lblTitle, :lblSiteName, :lblSSID, :lblDistance, :lblWebsite, :btnDirections, :btnCall, :btnReport, :lblAddress, :lblFeedbackMessage

		MESSAGE = "Your feedback is submitted, thank you for your support!"

		def initialize
			@lblTitle = CalLabel.new("* id:'action_bar_title'")
			@lblSiteName = CalLabel.new("* id:'siteName'")
			@lblSSID = CalLabel.new("* id:'ssid'")
			@lblDistance = CalLabel.new("* id:'distance'")
			@lblWebsite = CalLabel.new("* id:'website'")
			@btnDirections = CalButton.new("* id:'direction'")
			@btnCall = CalButton.new("* id:'call'")
			@btnReport = CalButton.new("* id:'report'")
			@lblAddress = CalLabel.new("* id:'address'")
			@lblFeedbackMessage = CalLabel.new("* id:'message'")
		end

		def pageExists
			HotspotData.new.btnDirections.waitTillAppears()
		end
	end

	class GPSOffMessage
		attr_accessor :lblTitle, :lblMessage, :btnSkip, :btnEnableGPS

		TITLE = "GPS is off."
		MESSAGE = "GPS is off. Do you want to turn it on?"
		SKIP = "Skip"
		ENABLE_GPS = "Enable GPS"
		
		def initialize
			@lblTitle = CalLabel.new("* id:'alertTitle'")
			@lblMessage = CalLabel.new("* id:'message'")
			@btnSkip = CalButton.new("* id:'button2'")
			@btnEnableGPS = CalButton.new("* id:'button1'")
		end

		def pageExists
			GPSOffMessage.new.lblTitle.waitTillAppears
		end
	end

	class GPSSkipData
		attr_accessor :lblTitle, :btnFilter, :txtSearch, :btnNearby, :lblMessage

		TITLE = "Hotspot Finder"
		MESSAGE = "Since GPS is off, you can only search for hotspots by address, city, zip, or airport code."
		
		def initialize
			@lblTitle = CalLabel.new("* id:'action_bar_title'")
			@btnFilter = CalButton.new("* id:'filter_button_id'")
			@txtSearch = CalText.new("* id:'city_edittext_id'")
			@btnNearby = CalButton.new("* id:'nearby_button_id'")
			@lblMessage = CalLabel.new("* id:'instruction_no_gps'")
		end

		def pageExists
			GPSSkipData.new.btnFilter.waitTillAppears()
		end
	end

	class InvalidGeoLocationError
		attr_accessor :lblMessage, :btnOK

		MESSAGE = "Sorry! We're having trouble pinpointing the location you entered."
		OK = "OK"
		
		def initialize
			@lblMessage = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button2'")
		end

		def pageExists
			InvalidGeoLocationError.new.btnOK.waitTillAppears()
		end
	end

	class NoHotspotData
		attr_accessor :lblMessage, :btnOK

		MESSAGE = "We couldn't find a hotspot!"
		OK = "OK"

		def initialize
			@lblMessage = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button2'")
		end
		
		def pageExists
			NoHotspotData.new.btnOK.waitTillAppears()
		end
	end

	class ReportFeedback
		attr_accessor :lblTitle, :lblSiteName, :lblAddress, :lblProblemTitle, :lblNoHotspotHere, :chkNoHotspotHere,
		:lblHotspotNotWorking, :chkHotspotNotWorking, :lblWrongAddress, :chkWrongAddress, :lblWrongNetworkName,  :chkWrongNetworkName,
		:lblOtherFeedback, :txtOtherFeedback, :btnSubmit

		TITLE = "Report a Problem"
		REPORTTITLE = "Report a problem"
		NOHOTSPOTHERE = "No hotspot here"
		HOTSPOTNOTWORKING = "Hotspot not working"
		WRONGADDRESS = "Wrong address"
		WRONGNETWORKNAME = "Wrong network name"
		OTHERFEEDBACK = "Other feedback"
		SUBMIT = "Submit"


		def initialize
			@lblTitle = CalLabel.new("* id:'action_bar_title'")
			@lblSiteName = CalLabel.new("* id:'siteName'")
			@lblAddress = CalLabel.new("* id:'address'")
			@lblProblemTitle = CalLabel.new("* id:'problem_title'")
			@lblNoHotspotHere = CalLabel.new("* id:'label1'")
			@chkNoHotspotHere = CalCheckbox.new("* id:'check1'")
			@lblHotspotNotWorking = CalLabel.new("* id:'label2'")
			@chkHotspotNotWorking = CalCheckbox.new("* id:'check2'")
			@lblWrongAddress = CalLabel.new("* id:'label3'")
			@chkWrongAddress = CalCheckbox.new("* id:'check3'")
			@lblWrongNetworkName = CalLabel.new("* id:'label4'")
			@chkWrongNetworkName = CalCheckbox.new("* id:'check4'")
			@lblOtherFeedback = CalLabel.new("* id:'other_feedback_title'")
			@txtOtherFeedback = CalText.new("* id:'other_feedback_id'")
			@btnSubmit = CalButton.new("* id:'submit_button_id'")

			@@logger = OMLogger.getLogger(HotspotFinder::ReportFeedback.name)
		end

		def pageExists
			ReportFeedback.new.chkNoHotspotHere.waitTillAppears
		end
	end

	class FilterView
		attr_accessor :lblFilters, :btnHotel, :btnRestaurant, :btnAirport, :btnOthers, :lblDistanceUnits, :swtDistanceUnits, :lblOfflineMode, 
		:swtOfflineMode, :lblOfflineAnnotation

		FILTERS = "Filters"
		DISTANCEUNITS = "Distance Units"
		OFFLINEMODE = "Offline Mode"
		OFFLINEANNOTATION = "Search for hotspots without using an Internet connection to reduce your data usage."

		def initialize
			@lblFilters = CalLabel.new("* id:'filter_title'")
			@btnHotel = CalButton.new("* id:'toggle_hotel'")
			@btnRestaurant = CalButton.new("* id:'toggle_restaurant'")
			@btnAirport = CalButton.new("* id:'toggle_airport'")
			@btnOthers = CalButton.new("* id:'toggle_other'")
			@lblDistanceUnits = CalLabel.new("* id:'hotspot_distance_unit_title'")
			@swtDistanceUnits = CalSwitch.new("* id:'switch_distance_unit'")
			@lblOfflineMode = CalLabel.new("* id:'hotspot_offline_data_title'")
			@swtOfflineMode = CalSwitch.new("* id:'switch_offline'")
			@lblOfflineAnnotation = CalLabel.new("* id:'hotspot_offline_data_annotation'")
		
			@@logger = OMLogger.getLogger(HotspotFinder::FilterView.name)
		end

		def pageExists
			FilterView.new.swtDistanceUnits.waitTillAppears
		end

		class OfflineModeOnMessage
			attr_accessor :lblMessage, :btnCancel,  :btnDownload

			MESSAGE = "Hotspots are not downloaded. Do you want to download it right now?"
			CANCEL = "Cancel"
			DOWNLOAD = "Download"

			def initialize
				@lblMessage = CalLabel.new("* id:'message'")
				@btnCancel = CalButton.new("* id:'button2'")
				@btnDownload = CalButton.new("* id:'button1'")
			end

			def pageExists
				OfflineModeOnMessage.new.btnDownload.waitTillAppears
			end

		end
	end

	class OfflineModeMapView
		attr_accessor :lblTitle, :lblMessage

		TITLE = "Hotspot Finder"
		MESSAGE = "Map is not available in offline mode"

		def initialize
			@lblTitle = CalLabel.new("* id:'action_bar_title'")
			@lblMessage = CalLabel.new("* id:'instruction_no_map'")
		end

		def pageExists
			OfflineModeMapView.new.lblMessage.waitTillAppears()
		end

	end
end #class ends


######Class Defns#######
class HotspotFinderDefns
	include Calabash::Android::Operations

	@@places = {
		"RWS_Office" => {
			:lat => 37.5379176,
			:long => -122.2534841
		},
		"BLR_Office" => {
			:lat => 12.9711065,
			:long => 77.6147642
		},
		"JFK_Airport_NY" => {
			:lat => 40.6413111,
			:long => -73.77813909999999
		}
	}

	def initialize
		@@logger = OMLogger.getLogger(HotspotFinderDefns.name)
	end

	def self.places
		return @@places
	end

	def GetRawData(loc=nil)
		#uldb = "https://uldb-hs.ipass.com/v2/getnearbyhotspots?lat=12.9711065&lng=77.6147642&miles=5&limit=50&platform=AndroidPhone&api_key=ProfFalken"
		if loc.nil?
			loc = "RWS_Office"
		end

		latValue = @@places["#{loc}"][:lat]
		longValue = @@places["#{loc}"][:long]
		uldb = "https://uldb-hs.ipass.com/v2/getnearbyhotspots?lat=#{latValue}&lng=#{longValue}&miles=5&limit=50&platform=AndroidPhone&api_key=ProfFalken"

		netObj = Network.new(uldb)
		netObj.SendRequest()
		jsonRes = netObj.GetResponse()

		begin
			jsonRes = JSON.parse(jsonRes)
      		@@logger.info("json string is valid")
      		return jsonRes
    	rescue Exception => e
      		@@logger.fatal("Invalid json string -> #{jsonRes}")
    	end
	end
 
 	def GetFormattedDataFromJson(loc=nil)
		h = Hash.new; arr = [];
		siteName, distance, ssid, address = nil
		data = GetRawData(loc)

		data.each_with_index do |item, index|
			siteName = data[index]["SiteName"]
			distance = data[index]["distance"]
			ssid = data[index]["SSID"]
			address = data[index]["SiteAddress"]
		
			h = {"siteName" => "#{siteName}", "ssid" => "#{ssid}", "address" => "#{address}", "distance" => "#{distance}"}
			arr.push(h)
		end
		return arr
	end

	def GetDeviceHotspotData
		arr = []; tmpArr = []
		i = 0
		endOfList = false
		sitename, ssid, distance, address = nil

		siteNameQueryString = "* id:'list' RobotoTextView * id:'siteName'"
		distanceQueryString = "* id:'list' RobotoTextView * id:'distance'"
		ssidQueryString = "* id:'list' RobotoTextView * id:'ssid'"
		addressQueryString = "* id:'list' RobotoTextView * id:'address'"
		endOfListQueryString = "* id:'list' RobotoTextView index:0"

		until endOfList

			elementsLen = HotspotFinder.new.lblHostpotList.getElement.length
			puts "elementsLen --> #{elementsLen}"
			mod = elementsLen%4 

			if !mod === 0
				maxCount = (elementsLen-mod)/4
			else
				maxCount = elementsLen/4
			end
			
			@@logger.info("MAXCOUNT --> #{maxCount}")

			until i > maxCount-1
				sitename = Calx.new.GetText("#{siteNameQueryString} index:#{i}")
				distance = Calx.new.GetText("#{distanceQueryString} index:#{i}")
				ssid = Calx.new.GetText("#{ssidQueryString} index:#{i}")
				address = Calx.new.GetText("#{addressQueryString} index:#{i}")

				h = {"siteName" => "#{sitename}", "ssid" => "#{ssid}", "address" => "#{address}", "distance" => "#{distance}"}
				tmpArr.push(h)
				@@logger.debug("TMPARR --> #{tmpArr}")
				i += 1
			end
			performAction("scroll_down")
			i = 0 #reset i
		
			if !(Calx.new.ExecuteQuery(endOfListQueryString, "id") === "siteName")
				@@logger.info("Couldn't find siteName")
				performAction("scroll_up")
				performAction("scroll_down")
			end

			@@logger.debug("ARRAY --> #{arr}")

			incre = 0
			while i < tmpArr.length
				add = Calx.new.GetText("#{addressQueryString} index:#{i}")
				site = Calx.new.GetText("#{siteNameQueryString} index:#{i}")
				
				@@logger.debug("================")
				@@logger.debug("#{tmpArr[i]["address"]} === #{add}")
				@@logger.debug("================")

				if (tmpArr[i]["address"] === add)

					@@logger.debug("================")
					@@logger.debug("#{tmpArr[i]["siteName"]} === #{site}")
					@@logger.debug("================")

					if (tmpArr[i]["siteName"] === site)
						i += 1
						incre +=1
					else
						i += 1
					end
				else 
					for data in tmpArr; arr.push(data); end
					break;
				end
			end
			
			if incre === tmpArr.length
				endOfList = true
				@@logger.info("Probably have reached the end of the list")

				#for data in tmpArr; arr.push(data); end #Add the last set of network list to arr
				performAction('scroll_down')
				elementsLen = HotspotFinder.new.lblHostpotList.getElement.length
				mod = elementsLen%4
				iterValue = elementsLen/4

				puts "LAST elementsLen --> #{elementsLen}"
				#sitenameLength = Calx.new.GetText("#{siteNameQueryString}").length
				
				if !(mod === 0) 
					puts "Entered myif"
					@@logger.info("Adding last set of networks to array")
					k = 1
					#if sitenameLength === 	
					while k < iterValue+1
						sitename = Calx.new.GetText("#{siteNameQueryString} index:#{k-1}")
						puts "SITENAME --> #{sitename}"
						distance = Calx.new.GetText("#{distanceQueryString} index:#{k-1}")
						puts "DISTANCE --> #{distance}"
						ssid = Calx.new.GetText("#{ssidQueryString} index:#{k-1}") #changed
						puts "SSID --> #{ssid}"
						address = Calx.new.GetText("#{addressQueryString} index:#{k-1}") #changed
						puts "ADDRESS --> #{address}"
						
							for data in arr
								if !data.has_value?sitename
									if !data.has_value?address
										h = {"siteName" => "#{sitename}", "ssid" => "#{ssid}", "address" => "#{address}", "distance" => "#{distance}"}
										arr.push(h)
										break;
									end
								end
							end
							k = k+1
							puts "New Value of k --> #{k}"
					end
				else
					for data in tmpArr; arr.push(data); end #Add the last set of network list to arr
				end
			end

			i = 0 #Reset i again
			tmpArr = []		
		end
		@@logger.info("Array length --> #{arr.uniq.length}")
		return arr.uniq
	end

	def GetMatchingNetworksCount(loc=nil)
		count = 0
		hsDB = GetFormattedDataFromJson(loc)
		hsDevice = GetDeviceHotspotData()
		
		for data in hsDevice
			site = data["siteName"]
			address = data["address"]
		
			for dbData in hsDB
				if site === dbData["siteName"]
					@@logger.info("Found matching SiteName --> #{site} === #{dbData["siteName"]}")
					if address === dbData["address"]
						@@logger.info("Found matching Address --> #{address} === #{dbData["address"]}")
						count += 1
					end
				end
			end
		end

		return {"MatchingNetworks" => "#{count}", "HotspotsFromDB" => "#{hsDB.length}", "HotspotsFromDevice" => "#{hsDevice.length}"}
	end

	def GetProblemTypeFromHotspotReports
		arr = []
		#url = "https://uldb-hs-dev.ipass.com/simpleview/userhotspotreports?api_key=ProfFalken"
		url = "https://uldb-hs.ipass.com/simpleview/userhotspotreports?api_key=ProfFalken"
		obj = Network.new(url)
		res = obj.GetResponse

		res = res.split("<table >")[1].split("</table>")
		rows = res[0].split("<tr>")

		for data in rows
		  if data.include?"<td"
		    tableData = data.split("<td  ")

		    for item in tableData
		      
		      if item.include?"Automation"
		        arr.push(item[/\>.*?\</].delete("<>").strip)
		      elsif item.empty?
		          arr.push(item[/\>.*?\</].delete("<>").strip)
		      end
		    end
		  
		  end
		end

		@@logger.info("arr --> #{arr}")
		return arr
	end

end #class Ends


######Error Dialogs#######

Then(/^I assert all the elements on the offline hotspot message$/) do
	_Message = HotspotFinder::OfflineModeMessage::MESSAGE; _Ok = HotspotFinder::OfflineModeMessage::BUTTON

	h = { _Message => @page.lblMessage.getText(), _Ok => @page.btnOK.getText() }
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on the hotspot finder page$/) do
	_Title = HotspotFinder::TITLE;
	sleep 2
	h = {_Title => @page.lblTitle.getText()}
	Calx.new.AssertTextAll(h)
	@page.btnMap.waitTillAppears()
	@page.btnFilter.waitTillAppears()
	@page.btnNearby.waitTillAppears()
end

Then(/^I assert all elements on the search view on the hotspot finder page$/) do
	_Find = HotspotFinder::SearchView::FIND; _Near = HotspotFinder::SearchView::NEAR; _Search = HotspotFinder::SearchView::SEARCH
	h = {_Find => @page.lblFind.getText(), _Near => @page.lblNear.getText(), _Search => @page.btnSearch.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on the no hotspot data page$/) do
	_Message = HotspotFinder::NoHotspotData::MESSAGE; _OK = HotspotFinder::NoHotspotData::OK
	h = {_Message => @page.lblMessage.getText(), _OK => @page.btnOK.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on the filter view on the hotspot finder page$/) do
	_Filter = HotspotFinder::FilterView::FILTERS; _DistanceUnits = HotspotFinder::FilterView::DISTANCEUNITS;
	_OfflineMode = HotspotFinder::FilterView::OFFLINEMODE; _OfflineAnnot = HotspotFinder::FilterView::OFFLINEANNOTATION;
	h = {_Filter => @page.lblFilters.getText(), _DistanceUnits => @page.lblDistanceUnits.getText(), 
		_OfflineMode => @page.lblOfflineMode.getText(), _OfflineAnnot => @page.lblOfflineAnnotation.getText()}
		Calx.new.AssertTextAll(h);
		@page.btnHotel.waitTillAppears
		@page.btnRestaurant.waitTillAppears
		@page.btnAirport.waitTillAppears
		@page.btnOthers.waitTillAppears
		@page.swtDistanceUnits.waitTillAppears
		@page.swtOfflineMode.waitTillAppears
end

Then(/^I scroll through the networks on the hotspot finder page$/) do
	arr = []
	5.times do
		res = @page.lblSiteName.getElement()
		arr.push(Calx.new.GetTextFromElements(res))
		performAction('scroll_down')
	end
	puts "Found hotspot with siteNames --> #{arr}"
end

Then(/^I see networks in the hotspot finder page$/) do
	arr = []
	res = @page.lblSiteName.getElement()
	arr.push(Calx.new.GetTextFromElements(res))
	if arr[0].empty?
		raise "No networks shown"
	end
	puts "Networks shown --> #{arr}"
end

Then(/^I tap the map button to see the map view$/) do
	@page.btnMap.tap()
	@page = Base.new.Page(HotspotFinder::MapView)
	@page.pageExists()
end

Then(/^I tap the map button to see map view in offline mode$/) do
	@page.btnMap.tap()
	@page = Base.new.Page(HotspotFinder::OfflineModeMapView)
	@page.pageExists
end

Then(/^I tap list button to see the hotspot finder page$/) do
	@page.btnBackToListView.tap()
	@page = Base.new.Page(HotspotFinder)
	@page.pageExists()
end

Then(/^I tap the search field on hotspot finder page to see the filter view$/) do
	@page.txtCity.waitTillAppears()
	@page.txtCity.tap()
	@page = Base.new.Page(HotspotFinder::SearchView)
	@page.pageExists()
end

Then(/^I tap the search button on filter view$/) do
	@page.btnSearch.tap()
	@page = Base.new.Page(HotspotFinder)
	@page.pageExists()
end

Then(/^I compare the networks shown on the device with HSF db for location "([^\""]*)"$/) do |arg|
	h = HotspotFinderDefns.new.GetMatchingNetworksCount(arg)
	
	matchingNetworks = h["MatchingNetworks"]
	hotspotsDB = h["HotspotsFromDB"]
	hotspotDevice = h["HotspotsFromDevice"]
	puts "No. of matching networks --> #{matchingNetworks}"
	puts "No. of hotspots from DB --> #{hotspotsDB}"
	puts "No. of hotspots from Device --> #{hotspotDevice}"

	res = (((hotspotDevice.to_f)/(hotspotsDB.to_f))*100)
	if res < 40.0
		raise "No. of hotspots found on device (#{hotspotDevice}) are less compared to DB (#{hotspotsDB})"
	elsif (res > 40.0) && (res < 70.0)
		puts "Moderate no. of hotspots found on device (#{hotspotDevice}) as compared to DB (#{hotspotsDB})"
	else
		puts "Good no. of matching hotspots found on device (#{hotspotDevice}) and DB (#{hotspotsDB})"
	end
end

Then(/^I enter new york location in the search field and tap search$/) do
	@page.txtNear.waitTillAppears
	@page.txtNear.set("JFK Airport NY")
	step 'I tap the search button on filter view'
end

Then(/^I get the hotspot details from the first hotspot$/) do
	@site = @page.lblSiteName.getText()
	@ssid = @page.lblSSID.getText()
	@dist = @page.lblDistance.getText()
	@addr = @page.lblAddress.getText()
end

Then(/^I tap on the first hotspot displayed on the HSF page$/) do
	step 'I get the hotspot details from the first hotspot'
	@page.lblSiteName.tap()
	@page = Base.new.Page(HotspotFinder::HotspotData)
	@page.pageExists
end

Then(/^I tap directions button on the hotspot data page$/) do
	@page.btnDirections.tap()
	@oage = Base.new.Page()
end

Then(/^I tap on skip option to see GPS off page$/) do
	@page.btnSkip.tap()
	@page = Base.new.Page(HotspotFinder::GPSSkipData)
	@page.pageExists
end

Then(/^I tap on enable GPS option and enable GPS$/) do
	@page.btnEnableGPS.tap()
	step 'I enable location services when the view is already opened'
	@page = Base.new.Page(HotspotFinder)
	@page.pageExists()
end

Then(/^I tap the nearby button on the hotspot finder page$/) do
	@page.btnNearby.tap()
end

Then(/^I tap the nearby button on the hotspot finder page and disconnect from Wi-Fi to see no internet error$/) do
	@page.btnNearby.tap()
	step 'I disconnect from Wi-Fi'
	step 'I launch OM'
	@page = Base.new.Page(HotspotFinder::OfflineModeMessage)
	@page.pageExists
end

Then(/^I tap back button on the map view to see hotspot list$/) do
	@page.btnBackToListView.tap()
	@page = Base.new.Page(HotspotFinder)
	@page.pageExists
end

Then(/^I search for an invalid geo location$/) do
	@page.txtNear.set("asdasdasd")
	@page.btnSearch.tap()
	@page = Base.new.Page(HotspotFinder::InvalidGeoLocationError)
	@page.pageExists
end

Then(/^I assert all the elements on the hotspot details view$/) do
	siteName = @page.lblSiteName.getText()
	ssid = @page.lblSSID.getText()

	h = {@site => siteName, @ssid => ssid}
	Calx.new.AssertTextAll(h)
	@page.btnDirections.waitTillAppears()
	@page.btnReport.waitTillAppears()
end

Then(/^I assert all elements on enable GPS page$/) do
	_Title = HotspotFinder::GPSOffMessage::TITLE; _Message = HotspotFinder::GPSOffMessage::MESSAGE; _Skip = HotspotFinder::GPSOffMessage::SKIP; 
	_EnableGPS = HotspotFinder::GPSOffMessage::ENABLE_GPS
	h = {_Title => @page.lblTitle.getText(), _Message => @page.lblMessage.getText(), _Skip => @page.btnSkip.getText(), 
		_EnableGPS => @page.btnEnableGPS.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on the GPS skip page$/) do
	_Title = HotspotFinder::GPSSkipData::TITLE; _Message = HotspotFinder::GPSSkipData::MESSAGE
	puts @page.lblTitle.getText()
	puts @page.lblMessage.getText()
	h = {_Title => @page.lblTitle.getText(), _Message => @page.lblMessage.getText()}
	Calx.new.AssertTextAll(h)
	@page.btnFilter.waitTillAppears()
	@page.txtSearch.waitTillAppears()
	@page.btnNearby.waitTillAppears()
end

Then(/^I assert all elements on the invalid geo location error message$/) do
	_Message = HotspotFinder::InvalidGeoLocationError::MESSAGE; _OK = HotspotFinder::InvalidGeoLocationError::OK
	h = {_Message => @page.lblMessage.getText(), _OK => @page.btnOK.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I should not see any networks in the HSF$/) do
	@page.lblSiteName.getText()
end

########### REPORT FEEDBACK STEPS ###############

Then(/^I tap report hotspot view$/) do
	@page.btnReport.tap()
	@page = Base.new.Page(HotspotFinder::ReportFeedback)
	@page.pageExists
end

Then(/^I assert all elements on the report hotspot view$/) do
	_Title = HotspotFinder::ReportFeedback::TITLE; _ReportTitle = HotspotFinder::ReportFeedback::REPORTTITLE; 
	_NoHotspotHere = HotspotFinder::ReportFeedback::NOHOTSPOTHERE; _HotspotNotWorking = HotspotFinder::ReportFeedback::HOTSPOTNOTWORKING;
	_WrongAddress = HotspotFinder::ReportFeedback::WRONGADDRESS; _WrongNetworkName = HotspotFinder::ReportFeedback::WRONGNETWORKNAME;
	_OtherFeedback = HotspotFinder::ReportFeedback::OTHERFEEDBACK; _Submit = HotspotFinder::ReportFeedback::SUBMIT
	h = {_Title => @page.lblTitle.getText(), _ReportTitle => @page.lblProblemTitle.getText(), _NoHotspotHere => @page.lblNoHotspotHere.getText(),
		_HotspotNotWorking => @page.lblHotspotNotWorking.getText(), _WrongAddress => @page.lblWrongAddress.getText(),
		_WrongNetworkName => @page.lblWrongNetworkName.getText(), _OtherFeedback => @page.lblOtherFeedback.getText(), _Submit => @page.btnSubmit.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I validate all the checkbox options available on the report hotspot view$/) do
	arr = [@page.chkWrongAddress, @page.chkNoHotspotHere, @page.chkWrongNetworkName, @page.chkHotspotNotWorking]
	begin	
		for data in arr
			data.tap()
			res = data.isChecked()
			if res
				puts "checkbox is checked"
			else
				raise "checkbox is not checked"
			end
		end
	rescue => e
		raise e.message
	ensure
		for data in arr
			data.tap()
			res = data.isChecked()
			if !res
				puts "checkbox is not checked"
			else
				raise "checkbox is checked"
			end
		end
	end
end

Then(/^I enter text into other feedback field on report hotspot view$/) do
	rand = MathRandom.new.GenRandom(4)
	@otherFeedbackMessage = "Automation run, kindly ignore_#{rand}"
	@page.txtOtherFeedback.set(@otherFeedbackMessage)
	
	if @otherFeedbackMessage === @page.txtOtherFeedback.getText()
		puts "Successfully entered text into other feedback field"
	else
		raise "Error while setting text into other feedback field"
	end
end

Then(/^I validate the other feedback field for max chars$/) do
	chars = MathRandom.new.GenRandom(302)
	@page.txtOtherFeedback.set(chars)

	if @page.txtOtherFeedback.getText().length > 300
		raise "Character length exceeds max character length"
	end
end

Then(/^I scroll through the other feedback text field$/) do
	performAction('scroll_up')
	sleep 2
	performAction('scroll_down')
end

Then(/^I verify if the submit is enabled$/) do
	enabled = @page.btnSubmit.isEnabled()
	if enabled
		raise "submit button is enabled"
	else
		puts "Submit button is not enabled"
	end
end

Then(/^I select a checkbox and verify if the submit button is enabled$/) do
	@chk = @page.chkHotspotNotWorking
	@chk.tap()
	begin
		step 'I verify if the submit is enabled'
	rescue => e
		puts "submit button is enabled"
	end
end

Then(/^I uncheck the checkbox and verify if the submit button is enabled$/) do
	@chk.tap()
	begin
		step 'I verify if the submit is enabled'
	rescue => e
		puts "submit button is enabled"
	end
end

Then(/^I tap submit button$/) do
	@page.btnSubmit.tap
	@page = Base.new.Page(HotspotFinder::HotspotData)
	@page.pageExists
end

Then(/^I enter some text into other feedback field and verify if the submit button is enabled$/) do
	@page.txtOtherFeedback.set("hotspot")
	begin
		step 'I verify if the submit is enabled'
	rescue => e
		puts "submit button is enabled"
	end
end

Then(/^I tap submit button and verify the feeback message$/) do
	found = false
	@page.btnSubmit.tap()
	@page = Base.new.Page(HotspotFinder::HotspotData)
	@page.pageExists

	_Message = HotspotFinder::HotspotData::MESSAGE
	10.times do
		begin
			h = {_Message => @page.lblFeedbackMessage.getText()}
			Calx.new.AssertTextAll(h)
			found = true
		rescue => e
			puts "Found Exception while quering"
			sleep 0.3
			found = false
		end
	end
	if !found
		raise "Couldn't find the toast message"
	end
end

Then(/^I verify if the message is uploaded to the report feedback server$/) do
	#@otherFeedbackMessage
	arrFeebackMessages = HotspotFinderDefns.new.GetProblemTypeFromHotspotReports()
	puts "Feeback Message entered --> #{@otherFeedbackMessage}"
	if arrFeebackMessages.include?@otherFeedbackMessage
		puts "Found message on the server"
	else
		raise "Couldn't find message on the server"
	end
end

##### Hotspot Offline Mode #####

Then(/^I tap filter button on the hotspot finder page$/) do
	@page.btnFilter.tap()
	@page = Base.new.Page(HotspotFinder::FilterView)
	@page.pageExists
end

Then(/^I toggle offline mode switch on the filter view to see hotspot download message$/) do
	@page.swtOfflineMode.tap()
	@page = Base.new.Page(HotspotFinder::FilterView::OfflineModeOnMessage)
	@page.pageExists
end

Then(/^I assert all elements on the hotspot download message$/) do
	_Message = HotspotFinder::FilterView::OfflineModeOnMessage::MESSAGE; _Cancel = HotspotFinder::FilterView::OfflineModeOnMessage::CANCEL;
	_Download = HotspotFinder::FilterView::OfflineModeOnMessage::DOWNLOAD
	h = {_Message => @page.lblMessage.getText(), _Cancel => @page.btnCancel.getText(), _Download => @page.btnDownload.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/I tap filter button on the map view/) do
	@page.btnFilter.tap()
	@page = Base.new.Page(HotspotFinder::FilterView)
	@page.pageExists()
end

Then(/^I tap download on the offline mode message to see download hotspot list view$/) do
	@page.btnDownload.tap()
	@page = Base.new.Page(DownloadHotspotLists)
	@page.pageExists()
end

Then(/^I assert all elements on the map view in offline mode$/) do
	_Title = HotspotFinder::OfflineModeMapView::TITLE; _Message = HotspotFinder::OfflineModeMapView::MESSAGE
	h = {_Title => @page.lblTitle.getText(), _Message => @page.lblMessage.getText()}
	Calx.new.AssertTextAll(h)
end
