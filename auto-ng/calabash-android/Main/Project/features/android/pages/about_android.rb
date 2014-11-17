
#### Class
class About

	attr_accessor :lblTitle, :lblVersion, :lblProfileID, :btnUpdateNetworks, :btnReplaceProfile, :btnMoreInfo, :btnLegalInfo

	TITLE = "About"
	UPDATENETWORKS = "Update Networks"
	REPLACEPROFILE = "Replace Profile"
	MOREINFO = "More Info"
	LEGALINFORMATION = "Legal Information"


	def initialize
		@lblTitle = CalLabel.new("* id:'action_bar_title'")
		@lblVersion = CalLabel.new("* id:'AboutActivity.appversion'")
		@lblProfileID = CalLabel.new("* id:'AboutActivity.proifle_ID'")
		@btnUpdateNetworks = CalButton.new("* id:'update_btn'")
		@btnReplaceProfile = CalButton.new("* id:'btn_replace_profile'")
		@btnMoreInfo = CalButton.new("* id:'more_info_btn'")
		@btnLegalInfo = CalButton.new("* id:'btn_legal_information'")
	end

	def pageExists
		About.new.btnMoreInfo.waitTillAppears()
	end

	class UpdateNetworks
		attr_accessor :lblMessage1, :lblMessage2, :btnOK 

		MESSAGE1 = "Congrats! Your networks are up-to-date!"
		MESSAGE2 = "You're all caught up!"
		OK = "OK"

		def initialize
			@lblMessage1 = CalLabel.new("* id:'message'") 
			@lblMessage2 = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button1'")

			@@logger = OMLogger.getLogger(UpdateNetworks.name)
		end	

		def pageExists
			UpdateNetworks.new.btnOK.waitTillAppears()
		end	
	end	

	class NoUpdateNetworks
		attr_accessor :lblMessage, :btnOK

		 MESSAGE = "The update requires an Internet connection."
		 OK = "OK"

		def initialize
			@lblMessage = CalLabel.new("* id:'message'")
			
			@btnOK =CalButton.new("* id:'button1'")

			@@logger = OMLogger.getLogger(NoUpdateNetworks.name)
		end	

		def pageExists
			NoUpdateNetworks.new.lblMessage.waitTillAppears()
		end	
    end	

	class ReplaceProfile
		attr_accessor :lblTitle, :lblMessage, :btnCancel, :btnOK

        TITLE = "Profile"
		MESSAGE = "You're about to replace your profile and there's no going back. Are you sure you want to continue?"
		OK = "OK"
		CANCEL = "Cancel"

		def initialize
			@lblTitle = CalLabel.new("* id:'alertTitle'")
			@lblMessage = CalLabel.new("* id:'message'")
			@btnCancel = CalLabel.new("* id:'button2'")
			@btnOK = CalButton.new("* id:'button1'")

			@@logger = OMLogger.getLogger(ReplaceProfile.name)
		end	

		def pageExists
			ReplaceProfile.new.lblMessage.waitTillAppears()
		end	
	end
	
	class MoreInfo
	     attr_accessor :btnMoreinfo, :lblDirectory, :lblLicense
         
         DIRECTORY = "Directory: Unactivated"  
	     LICENSE = "This application utilizes software licensed under: Accuris Networks Ltd., DnsJava project, Oracle, SpongyCastle project, libxml2 project \n\n"

	    def initialize
	    	@btnMoreinfo = CalButton.new("* id:'action_bar_title'")
	    	@lblDirectory = CalLabel.new("* id:'moreinfo.directory'")
	    	@lblLicense = CalLabel.new("* id:'more_info_license'")

	    	@@logger = OMLogger.getLogger(MoreInfo.name)
	    end  

	    def pageExists
	    	MoreInfo.new.btnMoreinfo.waitTillAppears()
        end
	end	

end

class AboutDefns
	include Calabash::Android::Operations

	def initialize
		@@logger = OMLogger.getLogger(About.name)
	end

	def GetVersion
	  	res = About.new.lblVersion.getText
  		data = res.scan(/:([^\"]*)/)[0]
 
  		if $sTestLang == "Japanese"
    		data = res.scan(/：([^\"]*)/)[0]
    		elsif $sTestLang == "Simplified Chinese"
      			data = res.scan(/：([^\"]*)/)[0]
    			elsif $sTestLang == "Traditional Chinese"
      				data = res.scan(/：([^\"]*)/)[0]  
  		end

  		buildNo = data[0].strip
	  	@@logger.info("BuildNo --> #{buildNo}")
	  	return buildNo
	end

	def GetProfileIDVersion
       	data =  About.new.lblProfileID.getText
        puts "Profileversion --> #{data}"
        currLang = Locale.new.GetLanguageFromISOCode

        if currLang === "Japanese"
          	puts "found language - #{currLang}"
          	str = data.split("：")[1].strip 
        elsif currLang === "Simplified Chinese"
           	puts "found language - #{currLang}"
            str = data.split("：")[1].strip
        elsif currLang === "Traditional Chinese"
            puts "found language - #{currLang}"
            str = data.split("：")[1].strip
        else
			puts "Found current language --> #{currLang}"
			str = data.split(":")[1].strip
			puts "Reached else part --> #{str}"
        end
       	
       	if data.nil?
          raise "Couldn't find profile id locator"
        end

        ver = str.split(" ")[0].strip
        #puts "ver --> #{ver}"
        return ver
    end
end


############## Step Definitions ################
Then(/^I assert all elements on about page$/) do
	_Title = About::TITLE; _UpdateNetworks = About::UPDATENETWORKS; _ReplaceProfile = About::REPLACEPROFILE; _MoreInfo = About::MOREINFO; _Legalinfo = About::LEGALINFORMATION
	h = {_Title => @page.lblTitle.getText(), _UpdateNetworks => @page.btnUpdateNetworks.getText(), _ReplaceProfile => @page.btnReplaceProfile.getText(),
	 _MoreInfo => @page.btnMoreInfo.getText(), _Legalinfo => @page.btnLegalInfo.getText()}
	 Calx.new.AssertTextAll(h)
end
Then(/^I assert all elements on about page when client activated defaultmode$/) do
	_Title = About::TITLE; _MoreInfo = About::MOREINFO
	h ={_Title => @page.lblTitle.getText(), _MoreInfo => @page.btnMoreInfo.getText()}
	  Calx.new.AssertTextAll(h)
end

Then(/^I validate the build no on the app$/) do
	res = Adr.new.GetBuildNo
	buildFromAdrFile = res.gsub(/-/,".")
	buildOnDevice = AboutDefns.new.GetVersion

	if buildOnDevice.include?buildFromAdrFile
		puts "Build no's match"
	else
		raise "Build no's dont match - found #{buildOnDevice} on device & #{buildFromAdrFile} in ADR"
	end

end

Then(/^I verify profile id with "([^\"]*)"$/) do |profileId|
	res = AboutDefns.new.GetProfileIDVersion
	puts "res from GetProfileIDVersion --> #{res}"
	
	profileId = eval("$#{profileId}").to_i
	if profileId === res.to_i
		puts "Profile id's match"
	else
		raise "Profile id's dont match, 'got values as, Device = #{res} & 'Adr = #{profileId}'"
	end

end

Then(/^I tap update networks on about page$/) do
	@page.btnUpdateNetworks.tap()
	@page = Base.new.Page(About::UpdateNetworks)
	@page.pageExists
end

Then(/^I tap replace profile on about page$/) do
	@page.btnReplaceProfile.tap()
	@page = Base.new.Page(About::ReplaceProfile)
	@page.pageExists
end

Then(/^I tap more info on about page$/) do
	@page.btnMoreInfo.tap()
	@page = Base.new.Page(About::MoreInfo)
	@page.pageExists
end

Then(/^I assert all elements in update networks view$/) do
	_Message1 = About::UpdateNetworks::MESSAGE1; _Message2 = About::UpdateNetworks::MESSAGE2; _Ok = About::UpdateNetworks::OK
	a = {_Message1 => @page.lblMessage1.getText()}
	b = {_Message2 => @page.lblMessage2.getText()}
	c = {_Ok => @page.btnOK.getText()}
    begin
		h = a.merge(c)
		Calx.new.AssertTextAll(h)
	rescue => e
		h = {}
		h = b.merge(c)
		Calx.new.AssertTextAll(h)
	end
end

Then(/^I tap ok on update networks view to see about page$/) do
    @page.btnOK.tap()
    @page = Base.new.Page(About)
    @page.pageExists 
end

Then(/^I assert all elements on replace profile page$/) do
	_Title = About::ReplaceProfile::TITLE; _Message = About::ReplaceProfile::MESSAGE; _Ok = About::ReplaceProfile::OK; _Cancel = About::ReplaceProfile::CANCEL
	h = {_Title => @page.lblTitle.getText(), _Message => @page.lblMessage.getText(), _Ok => @page.btnOK.getText(), _Cancel => @page.btnCancel.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap cancel on replace profile view$/) do
	@page.btnCancel.tap()
	@page = Base.new.Page(About)
	@page.pageExists
end

Then(/^I tap ok on replace profile view to see activationcode page$/) do
    @page.btnOK.tap()
	@page = Base.new.Page(ActivationCode)
	@page.pageExists
end

Then(/^I assert all elements in more info page$/) do
	_Directory = About::MoreInfo::DIRECTORY; _License = About::MoreInfo::LICENSE
	h = {_Directory  => @page.lblDirectory.getText(), _License => @page.lblLicense.getText()}
	Calx.new.AssertTextAll(h)
end
Then(/^I tap no update network view$/) do
	@page.btnUpdateNetworks.tap()
	@page = Base.new.Page(About::NoUpdateNetworks)
	@page.pageExists
end	

Then(/^I assert all elements in no update networks view$/) do
	_Message = About::NoUpdateNetworks::MESSAGE; _Ok = About::NoUpdateNetworks::OK
	h = {_Message => @page.lblMessage.getText(), _Ok => @page.btnOK.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap ok on no update networks view to see about page$/) do
	@page.btnOK.tap()
	@page = Base.new.Page(About)
	@page.pageExists
end

Then(/^I should not see replace profile option on about page$/) do
	 if !@page.btnReplaceProfile.isElementPresent
	 	puts "Replace Profile option doesn't exists"
	 else
	 	raise "Replace profile option exists"
	 end	 
end

Then(/^I should see replace profile option exists on about page$/) do
	 if @page.btnReplaceProfile.isElementPresent
	 	puts "Replace Profile option exists"
	 else 
	 	raise "Replace profile option doesn't exists"
	 end	
end
##################################