
##Class
class ActivationByUrl

	VALID_URL_NO_PIN = "http://activate.ipass.com?pid=#{$regular_profile_id}"
	VALID_URL_PIN = "http://activate.ipass.com?pid=#{$pin_profile_id}\\&pin=#{$profile_pin}"
	INVALID_URL = "http://activate.ipass.com?pid=#{$wrong_profile_id}"

	ANDROID_BROWSER = "com.android.browser/.BrowserActivity"
	OPEN_MOBILE = "com.iPass.OpenMobile/.Ui.ActivationActivity"

	def initialize
		@@logger = OMLogger.getLogger(ActivationByUrl.name)	
	end

	def self.ActivateClientByUrl(profile, prod=nil)
		#invoke ADB
		if prod.nil?
			prod = OPEN_MOBILE
		end
			adbCommand = "adb shell am start -a android.intent.action.VIEW -d #{profile} -n #{prod}"
			STDOUT.puts "Executing ADB, to invoke action INTENT"
			STDOUT.puts adbCommand
			`#{adbCommand}`
	end


	##Activation Message
	class ActivatedMessage
		attr_accessor :lblMessage, :btnOK

		MESSAGE = "Good news! iPass Open Mobile is already activated." 
		OK = "OK"

		def initialize
			@lblMessage = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button1'")
			
			@@logger = OMLogger.getLogger(ActivatedMessage.name)
		end

		def pageExists
			ActivatedMessage.new.btnOK.waitTillAppears	
		end
	end

	##Activation Error Message
	class ActivationErrorMessage
		attr_accessor :lblTitle, :lblMessage, :btnOK

		TITLE = "Oops!"
		MESSAGE = "Sorry! An error popped up while we were installing your application. Please try again."
		OK = "OK"

		def initialize
			@lblTitle = CalLabel.new("* id:'alertTitle'")
			@lblMessage = CalLabel.new("* id:'message'")
			@btnOK = CalLabel.new("* id:'button1'")

			@@logger = OMLogger.getLogger(ActivationErrorMessage.name)
		end

		def pageExists
			ActivationErrorMessage.new.btnOK.waitTillAppears
		end
	end

	##No Internet Error Message - Reuse class from activation code page
	

end

##Step Defns##
Then(/^I activate the client with regular profile via the url$/) do
	ActivationByUrl.ActivateClientByUrl(ActivationByUrl::VALID_URL_NO_PIN)
	@page = Base.new.Page(TravelPreference)
	@page.pageExists
	step 'I tap lets start on travel preference view'
end

Then(/^I activate the client with pin profile via the url$/) do
	ActivationByUrl.ActivateClientByUrl(ActivationByUrl::VALID_URL_PIN)
	@page = Base.new.Page(TravelPreference)
	@page.pageExists
	step 'I tap lets start on travel preference view'
end

Then(/^I try to activate the client using the browser$/) do
	ActivationByUrl.ActivateClientByUrl(ActivationByUrl::VALID_URL_NO_PIN, ActivationByUrl::ANDROID_BROWSER)
end

Then(/^I verify the client to be not activated$/) do
	@page = Base.new.Page(Welcome)
	@page.pageExists
end

Then(/^I try to activate an already activated client$/) do
	ActivationByUrl.ActivateClientByUrl(ActivationByUrl::VALID_URL_NO_PIN)
	@page = Base.new.Page(ActivationByUrl::ActivatedMessage)
	@page.pageExists
end

Then(/^I assert all elements on the activated message$/) do
	_Message = ActivationByUrl::ActivatedMessage::MESSAGE; _Ok = ActivationByUrl::ActivatedMessage::OK
	h = {_Message => @page.lblMessage.getText, _Ok => @page.btnOK.getText}
	Calx.new.AssertTextAll(h)
end

Then(/^I try to activate the client with an incorrect profile id$/) do
	ActivationByUrl.ActivateClientByUrl(ActivationByUrl::INVALID_URL)
	@page = Base.new.Page(ActivationByUrl::ActivationErrorMessage)
	@page.pageExists
end

Then(/^I assert all elements on the activation error message$/) do
	_Title = ActivationByUrl::ActivationErrorMessage::TITLE; _Message = ActivationByUrl::ActivationErrorMessage::MESSAGE;
	_Ok = ActivationByUrl::ActivationErrorMessage::OK
	h = {_Title => @page.lblTitle.getText, _Message => @page.lblMessage.getText, _Ok => @page.btnOK.getText}
	Calx.new.AssertTextAll(h)
end

Then(/^I try to activate the client with no internet connection$/) do
	ActivationByUrl.ActivateClientByUrl(ActivationByUrl::INVALID_URL)
	@page = Base.new.Page(ActivationCode::NoInternetError)
	@page.pageExists()
end

Then(/^I put the device to sleep while activating the client via the url$/) do
	ActivationByUrl.ActivateClientByUrl(ActivationByUrl::VALID_URL_NO_PIN)
	step 'I go to sleep'
	sleep 120
	step 'I wake up'
	step 'I launch OM'
	@page = Base.new.Page(TravelPreference)
	@page.pageExists
	step 'I tap lets start on travel preference view'
end

Then(/^I verify if the error dialog shows activate later option$/) do
	activateLater = CalButton.new("* marked:'#{Translate.new.OM_Translate("Activate Later")}'")
	tryAgain = CalButton.new("* marked:'#{Translate.new.OM_Translate("Try again")}'")

	if !tryAgain.isElementPresent
		if !activateLater.isElementPresent
			puts "Options 'Activate Later & 'Try again' not found"
		else
			raise "Activate later option found"
		end
	else
		raise "Try again option found"
	end
end
