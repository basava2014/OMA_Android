
#Classes
class TravelPreference
	attr_accessor :lblTitle, :lblHomeCountry, :lblCountry, :btnCountryList, :lblCountries, :lblTravelPreferenceTitle, :lblTavelMessage, :lblAfrica, :swtAfrica, :lblAmericas, :swtAmericas, :lblAsiaAndMiddleEast, :swtAsiaAndMiddleEast,
	:lblAustraliaAndOceania, :swtAustraliaAndOceania, :lblEurope, :swtEurope, :lblOfflineDataOfflineTitle, :lblInternetReq, :swtOfflineDataSwitch, :btnOK, :btnResume, :btnPause, :btnUpdate, :btnDownload

	TITLE = "Travel Preferences"
	HOMECOUNTRY = "Home Country"
	TRAVELPREFERENCETITLE = "Download Hotspot List?"
	TRAVELMESSAGE = "When you download hotspot list, iPass can help you find Wi-Fi hotspots locations when youre offline and traveling."
	REGION_AFRICA = "Africa"
	REGION_AMERICAS = "Americas"
	REGION_ASIA_MIDDLEEAST = "Asia and Middle East"
	REGION_AUSTRALIA_OCEANIA = "Australia and Oceania"
	REGION_EUROPE = "Europe"
	OFFLINEDATAOFFLINETITLE = "Display Maps and Hotspots Details"
	INTERNETREQUIRED = "Internet required"
	OK = "OK"
	RESUME = "Resume"
	PAUSE = "Pause"
	UPDATE = "Update"
	DOWNLOAD = "Download"
	
	def initialize
		@lblTitle = CalLabel.new("* id:'action_bar_title'")
		@lblHomeCountry = CalLabel.new("* id:'home_country_prompt'")
		@lblTravelPreferenceTitle = CalLabel.new("* id:'travel_preference_download_hotspot_title'")
		@lblTavelMessage = CalLabel.new("* id:'travel_preference_download_hotspot_annotation'")
		@lblCountry = CalLabel.new("* id:'home_country'")
		@btnCountryList = CalButton.new("* id:'btn_arrow'")
		@lblCountries = CalLabel.new("* id:'text1'")

		@lblAfrica = CalLabel.new("android.widget.LinearLayout * id:'region_name' index:0")
		@lblAmericas = CalLabel.new("android.widget.LinearLayout * id:'region_name' index:1")
		@lblAsiaAndMiddleEast = CalLabel.new("android.widget.LinearLayout * id:'region_name' index:2")
		@lblAustraliaAndOceania = CalLabel.new("android.widget.LinearLayout * id:'region_name' index:3")
		@lblEurope = CalLabel.new("android.widget.LinearLayout * id:'region_name' index:4")
		@swtAfrica = CalSwitch.new("android.widget.LinearLayout * id:'region_switch' index:0")
		@swtAmericas = CalSwitch.new("android.widget.LinearLayout * id:'region_switch' index:1")
		@swtAsiaAndMiddleEast = CalSwitch.new("android.widget.LinearLayout * id:'region_switch' index:2")
		@swtAustraliaAndOceania = CalSwitch.new("android.widget.LinearLayout * id:'region_switch' index:3")
		@swtEurope = CalSwitch.new("android.widget.LinearLayout * id:'region_switch' index:4")

		@lblOfflineDataOfflineTitle = CalLabel.new("* id:'travel_preference_offline_data_off_title'")
		@swtOfflineDataSwitch = CalSwitch.new("* id:'travel_preference_offline_data_off_switch'")
		@lblInternetReq = CalLabel.new("* id:'travel_preference_offline_data_off_annotation'")
		@btnOK = CalButton.new("* id:'btn_download'")
		@btnSave = @btnPause = @btnUpdate = @btnOK
	end

	def pageExists
		TravelPreference.new.lblTavelMessage.waitTillAppears()
	end

	def isDisplayed
		sleep 2
		return TravelPreference.new.lblTavelMessage.isElementPresent()
	end

	class ListCountries
		attr_accessor :lblTitle

		TITLE = "Select Country"

		def initialize
			@lblTitle = CalLabel.new("* id:'title'")

			@@logger = OMLogger.getLogger(ListCountries.name)
		end

		def pageExists
			ListCountries.new.lblTitle.waitTillAppears
		end
	end


end


###Class Defns####
class TravelPreferenceDefns
	include Calabash::Android::Operations

	@@US = "United States (US)"

	def initialize
		@@logger = OMLogger.getLogger(TravelPreferenceDefns.name)
	end

	def self.isCountrySet
		found = false
		begin
			res = TravelPreference.new.lblCountry.getText
			puts "res --> #{res}"
			if res.include?"#{Translate.new.OM_Translate("Select")}"
				raise
			else	
				found = true
			end
		rescue => e
			STDOUT.puts e.message
			puts "Looks like the country isn't set"
			found = false
		end
		return found
	end

	def self.selectCountry
		found = true
		puts "Country not set -- setting country"

		TravelPreference.new.pageExists
		TravelPreference.new.btnCountryList.tap
		TravelPreference::ListCountries.new.pageExists
		
		while found
			arr = TravelPreference.new.lblCountries.getElement
			countries = Calx.new.GetTextFromElements(arr)
			puts "countries --> #{countries}"

			if countries.include?@@US
				found = false
			else
				Calx.new.Scroll("down")
			end
		end

		Calx.new.Tap("* marked:'#{@@US}'")
		puts "country set successfully!"
	end
end


###Step Defns####
Then(/^I assert all elements on travel preference view seen on a first launch$/) do
	_Title = TravelPreference::TITLE; _HomeCountry = TravelPreference::HOMECOUNTRY; _TravelPreferenceTitle = TravelPreference::TRAVELPREFERENCETITLE; _TravelMessage = TravelPreference::TRAVELMESSAGE; 
	_Africa = TravelPreference::REGION_AFRICA; _Americas = TravelPreference::REGION_AMERICAS; _AsiaAndMiddleEast = TravelPreference::REGION_ASIA_MIDDLEEAST, 
	_AustraliaAndOceania = TravelPreference::REGION_AUSTRALIA_OCEANIA; _Europe = TravelPreference::REGION_EUROPE; _OfflineDataOfflineTitle = TravelPreference::OFFLINEDATAOFFLINETITLE;
	_InternetRequired = TravelPreference::INTERNETREQUIRED; _Ok = TravelPreference::OK; 
	
	a = {_Title => @page.lblTitle.getText, _HomeCountry => @page.lblHomeCountry.getText, _TravelPreferenceTitle => @page.lblTravelPreferenceTitle.getText, _TravelMessage => @page.lblTavelMessage.getText, 
		_Africa => @page.lblAfrica.getText, _Americas => @page.lblAmericas.getText, _AsiaAndMiddleEast => @page.lblAsiaAndMiddleEast.getText, _AustraliaAndOceania => @page.lblAustraliaAndOceania.getText, 
		_Europe => @page.lblEurope.getText}
	
	performAction("scroll_down")
	b = {_OfflineDataOfflineTitle => @page.lblOfflineDataOfflineTitle.getText, _InternetRequired => @page.lblInternetReq.getText, _Ok => @page.btnOK.getText}
	h = a.merge(b)
	 Calx.new.AssertTextAll(h)
	 @page.swtAfrica.waitTillAppears
	 @page.swtAmericas.waitTillAppears
	 @page.swtAsiaAndMiddleEast.waitTillAppears
	 @page.swtAustraliaAndOceania.waitTillAppears
	 @page.swtEurope.waitTillAppears
	 @page.swtOfflineDataSwitch.waitTillAppears
end

Then(/^I assert all elements on travel preference view$/) do
	_Title = TravelPreference::TITLE; _HomeCountry = TravelPreference::HOMECOUNTRY; _TravelPreferenceTitle = TravelPreference::TRAVELPREFERENCETITLE; _TravelMessage = TravelPreference::TRAVELMESSAGE; 
	_Africa = TravelPreference::REGION_AFRICA; _Americas = TravelPreference::REGION_AMERICAS; _AsiaAndMiddleEast = TravelPreference::REGION_ASIA_MIDDLEEAST, 
	_AustraliaAndOceania = TravelPreference::REGION_AUSTRALIA_OCEANIA; _Europe = TravelPreference::REGION_EUROPE; _OfflineDataOfflineTitle = TravelPreference::OFFLINEDATAOFFLINETITLE;
	_InternetRequired = TravelPreference::INTERNETREQUIRED; _Ok = TravelPreference::OK; 
	
	h = {_Title => @page.lblTitle.getText, _HomeCountry => @page.lblHomeCountry.getText, _TravelPreferenceTitle => @page.lblTravelPreferenceTitle.getText, _TravelMessage => @page.lblTavelMessage.getText, 
		_Africa => @page.lblAfrica.getText, _Americas => @page.lblAmericas.getText, _AsiaAndMiddleEast => @page.lblAsiaAndMiddleEast.getText, _AustraliaAndOceania => @page.lblAustraliaAndOceania.getText, 
		_Europe => @page.lblEurope.getText}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap lets start on travel preference view$/) do
	@page = Base.new.Page(TravelPreference)
	@page.pageExists
	if !TravelPreferenceDefns.isCountrySet
		TravelPreferenceDefns.selectCountry
	end

	step 'I toggle switch off for download hotspot'
	if !@page.btnOK.isElementPresent
		performAction("scroll_down")
	end
	@page.btnOK.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end

Then(/^I tap save on travel preference$/) do
	if !TravelPreferenceDefns.isCountrySet
		TravelPreferenceDefns.selectCountry
	end

	if !@page.btnOK.isElementPresent
		performAction("scroll_down")
	end
	@page.btnOK.tap()
	#puts "Launching OM"
	#step 'I launch OM'
	@page = Base.new.Page(DashBoard)
	@page.pageExists	
end

Then(/^I toggle switch off for download hotspot$/) do
	@page.swtOfflineDataSwitch.tap()
end

