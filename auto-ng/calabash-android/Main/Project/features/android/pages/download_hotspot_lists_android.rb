
##Classes##
class DownloadHotspotLists
	attr_accessor :lblTitle, :lblMessage, :lblAfrica, :lblAmericas, :lblAsiaAndMiddleEast, :lblAustraliaAndOceania, :lblEurope, 
	:swtAfrica, :swtAmericas, :swtAsiaAndMiddleEast, :swtAustraliaAndOceania, :swtEurope, :btnDownload, :btnUpdate, :lblOfflineMode, :swtOfflineMode, 
	:lblOfflineModeAnnotation

	TITLE = "Download"
	MESSAGE = "Please select the regions you like to download:"
	REGION_AFRICA = "Africa"
	REGION_AMERICAS = "Americas"
	REGION_ASIA_MIDDLEEAST = "Asia and Middle East"
	REGION_AUSTRALIA_OCEANIA = "Australia and Oceania"
	REGION_EUROPE = "Europe"
	DOWNLOAD = "Download"
	UPDATE = "Update"
	OFFLINEMODE = "Offline Mode"
	OFFLINEMODEANNOT = "Search for hotspots without using an Internet connection to reduce your data usage."


	def initialize
		@lblTitle = CalLabel.new("* id:'action_bar_title'")
		@lblMessage = CalLabel.new("* id:'download_prompt'")
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
		@btnDownload = CalButton.new("* id:'btn_download'")
		@btnUpdate = @btnDownload
		@lblOfflineMode = CalLabel.new("* id:'hotspot_offline_data_title'")
		@swtOfflineMode = CalSwitch.new("* id:'switch_offline'")
		@lblOfflineModeAnnotation = CalLabel.new("* id:'hotspot_offline_data_annotation'")
	end

	def pageExists
		DownloadHotspotLists.new.lblMessage.waitTillAppears
	end
end

##Class Defns##
class DownloadHotspotListsDefnds
end

##Steps##

Then(/^I assert all elements on the download hotspot lists view$/) do
	_Title = DownloadHotspotLists::TITLE; _Message = DownloadHotspotLists::MESSAGE; _Africa = DownloadHotspotLists::REGION_AFRICA; 
	_America = DownloadHotspotLists::REGION_AMERICAS; _AsiaAndMiddleEast = DownloadHotspotLists::REGION_ASIA_MIDDLEEAST; _AustraliaAndOceania = DownloadHotspotLists::REGION_AUSTRALIA_OCEANIA;
	_Europe = DownloadHotspotLists::REGION_EUROPE;

	h = {_Title => @page.lblTitle.getText, _Message => @page.lblMessage.getText, _Africa => @page.lblAfrica.getText, _America => @page.lblAmericas.getText,
	_AsiaAndMiddleEast => @page.lblAsiaAndMiddleEast.getText, _AustraliaAndOceania => @page.lblAustraliaAndOceanio.getText, _Europe => @page.lblEurope.getText}
	Calx.new.AssertTextAll(h)
	@page.swtAfrica.waitTillAppears()
	@page.swtAmericas.waitTillAppears()
	@page.swtAsiaAndMiddleEast.waitTillAppears()
	@page.swtAustraliaAndOceania.waitTillAppears()
	@page.swtEurope.waitTillAppears()
end

Then(/^I assert all elements after the hotspot data is downloaded$/) do
	_Title = DownloadHotspotLists::TITLE; _Message = DownloadHotspotLists::MESSAGE; _Africa = DownloadHotspotLists::REGION_AFRICA; 
	_America = DownloadHotspotLists::REGION_AMERICAS; _AsiaAndMiddleEast = DownloadHotspotLists::REGION_ASIA_MIDDLEEAST; _AustraliaAndOceania = DownloadHotspotLists::REGION_AUSTRALIA_OCEANIA;
	_Europe = DownloadHotspotLists::REGION_EUROPE;
	performAction("scroll_up")
	a = {_Title => @page.lblTitle.getText, _Message => @page.lblMessage.getText, _Africa => @page.lblAfrica.getText, _America => @page.lblAmericas.getText,
		_AsiaAndMiddleEast => @page.lblAsiaAndMiddleEast.getText, _AustraliaAndOceania => @page.lblAustraliaAndOceania.getText, _Europe => @page.lblEurope.getText}
	@page.swtAfrica.waitTillAppears()
	@page.swtAmericas.waitTillAppears()
	@page.swtAsiaAndMiddleEast.waitTillAppears()
	@page.swtAustraliaAndOceania.waitTillAppears()
	@page.swtEurope.waitTillAppears()
	performAction("scroll_down")

	_OfflineMode = DownloadHotspotLists::OFFLINEMODE; _OfflineModeAnnot = DownloadHotspotLists::OFFLINEMODEANNOT
	b = {_OfflineMode => @page.lblOfflineMode.getText, _OfflineModeAnnot => @page.lblOfflineModeAnnotation.getText}
	h = a.merge(b)
	Calx.new.AssertTextAll(h)
	@page.lblOfflineMode.waitTillAppears
	@page.lblOfflineModeAnnotation.waitTillAppears
	@page.swtOfflineMode.waitTillAppears
end

Then(/^I tap download and wait till the hotspot data is downloaded$/) do
	@page = Base.new.Page(DownloadHotspotLists)
	@page.btnDownload.tap()

	timeout = 60; count = 0
	while count < timeout
		#if #@page.lblPercent.getText.include?Translate.new.OM_Translate(DownloadHotspotLists::UPDATE)
		if @page.swtOfflineMode.isElementPresent
			puts "Offline hotspot data - download complete"
			break
		else
			performAction("scroll_down")
			sleep 10
			count += 1
		end
	end
	raise "Offline hotspot data download timed out" if count > timeout
end

Then(/^I tap update button on the download hotspot list page$/) do
	@page.btnUpdate.tap()
end

Then(/^I verify if the buttons on the view are disabled$/) do
	btnUpdate = @page.btnUpdate.isEnabled

	if !btnUpdate
		puts "Update button is disabled"
	else
		raise "Update button is enabled"
	end
end