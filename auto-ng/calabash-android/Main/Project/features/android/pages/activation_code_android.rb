
##Classes##
class ActivationCode
	attr_accessor :lblTitle, :lblProfileMessage, :lblProfile, :lblPin, :lblEmail, :txtProfileId, :txtPin, :txtEmail, :btnOK, :btnCancel
	
	TITLE = "Profile"
	PROFILEMESSAGE = "Please enter your profile, PIN and email below to continue."
	PROFILE = "Profile ID:"
	PIN = "PIN (may be optional):"
	EMAIL = "Email:"
	OK = "OK"
	CANCEL = "Cancel"


	def initialize
		@lblTitle = CalLabel.new("* id:'layout_heading'")
		@lblProfileMessage = CalLabel.new("* id:'client_message'")
		@lblProfile = CalLabel.new("* id:'profile_lbl'") 
		@lblPin = CalLabel.new("* id:'pin_lbl'")
		@lblEmail = CalLabel.new("* id:'email_lbl'")
		@txtProfileId = CalText.new("EditText id:'profileid_edit'")
		@txtPin = CalText.new("EditText id:'pin_edit'")
		@txtEmail = CalText.new("EditText id:'email_edit'")
		@btnOK = CalButton.new("* id:'btnOk'")
		@btnCancel = CalButton.new("* id:'btnCancel'")

		@@logger = OMLogger.getLogger(ActivationCode.name)
	end

	def pageExists
		ActivationCode.new.lblTitle.waitTillAppears()
	end

	class NoInternetError
		attr_accessor :lblTitle, :lblMessage, :btnOk

		TITLE = "Connection Error"
		MESSAGE = "Please connect to the Internet before activating."
		OK = "OK"

		def initialize
			@lblTitle = CalLabel.new("* id:'alertTitle'")
			@lblMessage = CalLabel.new("* id:'message'")
			@btnOk = CalButton.new("* id:'button1'")
		end

		def pageExists
			NoInternetError.new.btnOk.waitTillAppears()
		end
	end

	class WrongActivationCodeError
		attr_accessor :lblTitle, :lblMessage, :btnActivateLater, :btnTryAgain

		TITLE = "Oops!"
		MESSAGE = "That was the wrong Activation Code. Please try again."
		ACTIVATELATER = "Activate Later"
		TRYAGAIN = "Try again"

		def initialize
			@lblTitle = CalLabel.new("* id:'alertTitle'")
			@lblMessage = CalLabel.new("* id:'message'")
			@btnActivateLater = CalButton.new("* id:'button2'")
			@btnTryAgain = CalButton.new("* id:'button1'")
		end
		
		def pageExists()
			WrongActivationCodeError.new.btnTryAgain.waitTillAppears()
		end
	end

	class InvalidEmailError
		attr_accessor :lblTitle, :lblMessage, :btnActivateLater, :btnTryAgain

		TITLE = "Oops!"
		MESSAGE = "Oops! You need to enter a valid email address."
		ACTIVATELATER = "Activate Later"
		TRYAGAIN = "Try again"

		def initialize
			@lblTitle = CalLabel.new("* id:'alertTitle'")
			@lblMessage = CalLabel.new("* id:'message'")
			@btnActivateLater = CalButton.new("* id:'button2'")
			@btnTryAgain = CalButton.new("* id:'button1'")
		end
		
		def pageExists()
			InvalidEmailError.new.btnTryAgain.waitTillAppears()
		end
	end

end

class ActivationCodeDefns
	
	def ValidateFieldForMaxChars(len, field) #len = 10
		if field.include?"profile"
			txt = ActivationCode.new.txtProfileId.getText()
		elsif field.include?"pin"
			txt = ActivationCode.new.txtPin.getText()
		else
			txt = ActivationCode.new.txtEmail.getText()
			#puts "txt in email field --> #{txt}"
		end
			
		txt = txt.to_s
		txtLength = txt.length
		if txtLength > len.to_i
			raise "Field accepts more than #{len} chars - has #{txtLength}"
		else
			puts "Field has #{txtLength} chars"
		end
	end

end


#################STEPS##############

Then(/^I assert all the elements on activationcode page$/) do
	_title = ActivationCode::TITLE; _profileMessage = ActivationCode::PROFILEMESSAGE; _profile = ActivationCode::PROFILE; _pin = ActivationCode::PIN; 
	_email = ActivationCode::EMAIL; _ok = ActivationCode::OK; _cancel = ActivationCode::CANCEL

	h = {_title => @page.lblTitle.getText(), _profileMessage => @page.lblProfileMessage.getText(), _profile => @page.lblProfile.getText(), _pin => @page.lblPin.getText(),
		_email => @page.lblEmail.getText(), _ok => @page.btnOK.getText(), _cancel => @page.btnCancel.getText()}
	Calx.new.AssertTextAll(h)
end

#################

#####ERRORS STEPS######
Then(/^I tap ok on the activationcode page to see internet error message$/) do
	@page.btnOK.tap()
	@page = Base.new.Page(ActivationCode::NoInternetError)
	@page.pageExists()
end

Then(/^I tap ok on the activationcode page to see wrong activationcode message$/) do
	@page.btnOK.tap()
	@page = Base.new.Page(ActivationCode::WrongActivationCodeError)
	@page.pageExists()
end

Then(/^I tap ok on the activationcode page to see invalid emailformat error message$/) do
	@page.btnOK.tap()
	@page = Base.new.Page(ActivationCode::InvalidEmailError)
	@page.pageExists()
end
#################

#####ASSERTION STEPS##########
Then(/^I assert all elements on the internet error dialog$/) do
	_title = ActivationCode::NoInternetError::TITLE; _message = ActivationCode::NoInternetError::MESSAGE; _ok = ActivationCode::NoInternetError::OK
	h = {_title => @page.lblTitle.getText(), _message => @page.lblMessage.getText(), _ok => @page.btnOk.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all the elements on the wrong activation code error page$/) do
	_Title = ActivationCode::WrongActivationCodeError::TITLE; _Message = ActivationCode::WrongActivationCodeError::MESSAGE;
	_ActivateLater = ActivationCode::WrongActivationCodeError::ACTIVATELATER; _TryAgain = ActivationCode::WrongActivationCodeError::TRYAGAIN
	h = {_Title => @page.lblTitle.getText(), _Message => @page.lblMessage.getText(), _ActivateLater => @page.btnActivateLater.getText(),
	_TryAgain => @page.btnTryAgain.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all the elements on the invalid email error page$/) do
	_Title = ActivationCode::InvalidEmailError::TITLE; _Message = ActivationCode::InvalidEmailError::MESSAGE;
	_ActivateLater = ActivationCode::InvalidEmailError::ACTIVATELATER; _TryAgain = ActivationCode::InvalidEmailError::TRYAGAIN
	h = {_Title => @page.lblTitle.getText(), _Message => @page.lblMessage.getText(), _ActivateLater => @page.btnActivateLater.getText(),
	_TryAgain => @page.btnTryAgain.getText()}
	Calx.new.AssertTextAll(h)
end
#########################

##########EDIT TEXT STEPS#############

Then(/^I clear all fields on activationcode page$/) do
	@page.txtProfileId.set("")
	@page.txtPin.set("")
	@page.txtEmail.set("")
end

Then(/^I enter (regular|pin|favorite|generic|nowifi) profileid and tap ok/) do |profileType|
	case profileType
	when "regular"
		profileid = $regular_profile_id; pin = ""; email = $qa_email;
	when "pin"
		profileid = $pin_profile_id; pin = $profile_pin; email = $qa_email;
	when "favorite"
		profileid = $fav_profile_id; pin = ""; email = $qa_email;
	when "generic"
		profileid = $generic_profile_id; pin =""; email = $qa_email;
	when "nowifi"
		profileid = $noWifi_profile_id; pin =""; email = $qa_email;
	end

	step 'I clear all fields on activationcode page'
	@page.txtProfileId.set(profileid)
	@page.txtPin.set(pin)
	@page.txtEmail.set(email)
	@page.btnOK.tap()
	@page = Base.new.Page(TravelPreference)
	@page.pageExists
	step 'I tap lets start on travel preference view'
end

Then(/^I enter (regular|pin|noWifi|wrong) profile id$/) do |profileType|
	case profileType
	when "regular"
		profile = $regular_profile_id
	when "pin"
		profile = $pin_profile_id
	when "noWifi"
		profile = $noWifi_profile_id
	when "wrong"
		profile = $wrong_profile_id
	end
	@page.txtProfileId.set(profile)
end

Then(/^I enter pin for pin profile id$/) do
	@page.txtPin.set($profile_pin)
end

Then(/^I enter wrong pin$/) do
	@page.txtPin.set($wrong_profile_pin)
end

Then(/^I enter an email address$/) do
	@page.txtEmail.set($qa_email)
end

Then(/^I enter an invalid email address$/) do
	@page.txtEmail.set($qa_wrongemail)
end
#########################

###########TAP STEPS############
Then(/^I tap cancel button on activationcode page$/) do
	@page.btnCancel.tap()
	@page = Base.new.Page(Welcome)
	@page.pageExists()
end

Then(/^I tap cancel button on activationcode page to see about view$/) do
	@page.btnCancel.tap()
	@page = Base.new.Page(About)
	@page.pageExists()
end

Then(/^I tap ok button on activationcode page to see om dashboard$/) do
	@page.btnOK.tap()
	step 'I tap lets start on travel preference view'
end

Then(/^I tap ok button on activationcode page to see travel preference view$/) do
	@page.btnOK.tap()
	@page = Base.new.Page(TravelPreference)
	@page.pageExists()
end

Then(/^I tap try again to see activation code page$/) do
	@page.btnTryAgain.tap()
	@page = Base.new.Page(ActivationCode)
	@page.pageExists()
end

Then(/^I tap try again to see activation code page and email address retained$/) do
	@page.btnTryAgain.tap()
	@page = Base.new.Page(ActivationCode)
	@page.pageExists()
	email = @page.txtEmail.getText()
	if email == $qa_wrongemail
		puts "Found email address"
	else
		raise "Email address not retained"
	end
end

Then(/^I tap ok button on activationcode page$/) do
	@page.btnOK.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end

Then(/^I tap ok button on activationcode page to see wrong activationcode error message$/) do
	@page.btnOK.tap()
	@page = Base.new.Page(ActivationCode::WrongActivationCodeError)
	@page.pageExists
end

###########################

#####VERIFY STEPS#############
Then(/^I validate the "([^\"]*)" field to accept only "([^\"]*)" characters by entering "([^\"]*)" characters$/) do |field, actualLen, testLen|
	mathObj = MathRandom.new
	case field
	when "profile"
		chars = mathObj.GetRandomNumbers(testLen)
		@page.txtProfileId.set(chars)
	when "pin"
		chars = mathObj.GenRandom(testLen)
		@page.txtPin.set(chars)
	when "email"
		chars = mathObj.GenRandom(testLen)
		chars = "#{chars}@gmail.com"
		@page.txtEmail.set(chars)
	end
	ActivationCodeDefns.new.ValidateFieldForMaxChars(actualLen, field)
end

Then(/^I validate the pin field to accept alphanumeric characters$/) do
	@page.txtPin.set($profile_pin)
	str = @page.txtPin.getText()

	found = Support.new.IsAlpha(str)
	if found
		puts "Pin field accepts alphanumeric characters"
	else
		raise "Pin filed doesn't accept alphanumeric characters"
	end
end

Then(/^I verify if ok button is disabled on activation code page$/) do
	found = @page.btnOK.isEnabled()
	if found
		raise "Found button to be enabled"
	end
end

#############################
#Profile Finder
#############################

Then(/^I enter favorite (android|ios|windows) profileid and tap ok$/) do |platform|
	case platform
	when "android"
		profileid = $fav_profile_id; pin = $profile_pin; email = $qa_email;
	when "ios"
		profileid = $ios_fav_profile_id; pin = $ios_windows_profile_pin; email = $qa_email;
	when "windows"
		profileid = $windows_fav_profile_id; pin = $ios_windows_profile_pin; email = $qa_email;
	end

	step 'I clear all fields on activationcode page'
	@page.txtProfileId.set(profileid)
	@page.txtPin.set(pin)
	@page.txtEmail.set(email)
	@page.btnOK.tap()
	step 'I tap lets start on travel preference view'
	@page = Base.new.Page(DashBoard)
	@page.pageExists()	
end