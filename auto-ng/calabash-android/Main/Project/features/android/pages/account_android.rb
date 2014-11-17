
#Classes

class Account
	attr_accessor :lblTitle, :lblPrefix, :lblUsername, :lblPassword, :lblDomain, :lblNeedHelp, :btnSave, :btnCancel,
	:txtPrefix, :txtUsername, :txtPassword, :txtDomain

	TITLE = "Account Details"
	PREFIX = "Prefix"
	USERNAME = "Username"
	PASSWORD = "Password"
	DOMAIN = "Domain"
	NEEDHELP = "Need help?"
	SAVE = "Save"
	CANCEL = "Cancel"

	def initialize
		@lblTitle = CalLabel.new("* id:'action_bar_title'")
		@lblPrefix = CalLabel.new("* id:'lblPrefix'")
		@lblUsername = CalLabel.new("* id:'lblusername'")
		@lblPassword = CalLabel.new("* id:'lblPassword'")
		@lblDomain = CalLabel.new("* id:'lblDomain'")
		@txtPrefix = CalText.new("* id:'EditPrefix'")
		@txtUsername = CalText.new("* id:'EditTextID'")
		@txtPassword = CalText.new("* id:'EditTextPass'")
		@txtDomain = CalText.new("* id:'EditTextDomain'")
		@btnSave = CalButton.new("* id:'btnSave'")
		@btnCancel = CalButton.new("* id:'btnCancel'")
		@lblNeedHelp = CalLabel.new("* id:'txt_help'")
	end

	def pageExists
		Account.new.lblUsername.waitTillAppears
	end

	class CredentialSaveError
		attr_accessor :lblMessage, :btnOK

		#MESSAGE1= "Your username and password has been saved, but unfortunately, we could not reach the authentication servers to verify them at this time."
		MESSAGE = "Your username and password were saved, but couldn't be verified at this time, Please try again later."
		OK = "OK"

		def initialize
			@lblMessage = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button1'")

			@@logger = OMLogger.getLogger(CredentialSaveError.name)
		end

		def pageExists
			CredentialSaveError.new.btnOK.waitShort
		end
	end

	class WarnMessage
		attr_accessor :lblWrongUsernameMessage, :lblWarningMessage, :btnOK

	    WRONGUSERNAMEMESSAGE = "Whoops! Your username is incorrect."
		WARNINGMESSAGE = "Sorry! Your username can't include an @ symbol."

		def initialize
			@lblWrongUsernameMessage = CalLabel.new("* id:'alertTitle'")
            @lblWarningMessage = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button1'")

			@@loger = OMLogger.getLogger(WarnMessage.name)
		end
		
		def pageExists
		WarnMessage.new.btnOK.waitTillAppears
		end
	end	

	class CredWarningMessage
		attr_accessor :lblMessage, :btnCancel, :btnOK

		MESSAGE = "Sorry, that username and password doesn't appear to be correct. Do you still want to save?"

		def initialize
			@lblMessage = CalLabel.new("* id:'message'")
			@btnCancel = CalButton.new("* id:'button2'")
			@btnOK = CalButton.new("* id:'button1'")
           
            @@loger = OMLogger.getLogger(CredWarningMessage.name)
        end
        def pageExists
        	CredWarningMessage.new.btnOK.waitTillAppears
        end
	end	
	
	class Creds
		PREFIX = "IPASS/"; USERNAME = "android"; PASSWORD = "iatp@ssword"; DOMAIN = "iat.ipass.com";
	end

    class WrongCreds
    	PREFIX = "IPASS/"; USERNAME = "sad@"; PASSWORD = "iatpassword@"; DOMAIN = "ipass.com"
    end	

end

#Account defns
class AccountDefns
end

########## Step definitions ###########

Then(/^I assert all elements on the account view$/) do
	_Title = Account::TITLE; _Prefix = Account::PREFIX; _Username = Account::USERNAME; _Password = Account::PASSWORD; _Domain = Account::DOMAIN; 
    _Save = Account::SAVE;
	h = {_Title => @page.lblTitle.getText(), _Prefix => @page.lblPrefix.getText(), _Username => @page.lblUsername.getText(), 
		_Password => @page.lblPassword.getText(), _Domain => @page.lblDomain.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements in warning message view$/) do
	@page = Base.new.Page(Account::WarnMessage)
	@page.pageExists
	_Wrongusernamemessage = Account::WarnMessage::WRONGUSERNAMEMESSAGE; _Warningmessage = Account::WarnMessage::WARNINGMESSAGE;
	h = {_Wrongusernamemessage => @page.lblWrongUsernameMessage.getText(), _Warningmessage => @page.lblWarningMessage.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements in credentials save error view$/) do
	_Ok = Account::CredentialSaveError::OK
   	h = {_Ok => @page.btnOK.getText()}
    Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements in credentials warning message view$/) do
    _Message = Account::CredWarningMessage::MESSAGE;
    h = {_Message => @page.lblMessage.getText()}
    Calx.new.AssertTextAll(h)
end

Then(/^I tap ok on credentials warning message view$/) do
	@page.btnOK.tap()
	sleep 1
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end

Then(/^I tap ok on credentials save error view$/) do
 	@page.btnOK.tap()
 	@page = Base.new.Page(DashBoard)
 	@page.pageExists
end	   

Then(/^I enter android "([^\"]*)"$/) do |arg|
	case arg
	when "prefix"
		@page.txtPrefix.set(Account::Creds::PREFIX)
	when "username"
		@page.txtUsername.set(Account::Creds::USERNAME)
	when "password"
		@page.txtPassword.set(Account::Creds::PASSWORD)
	when "domain"
		@page.txtDomain.set(Account::Creds::DOMAIN)
	else
		raise "Invalid field - #{arg}"
	end
end

Then(/^I clear account settings$/) do
	system('adb shell am start -n com.iPass.OpenMobile/.Ui.AccountActivity')
	sleep 3
	@page = Base.new.Page(Account)
	@page.pageExists

	@page.txtPrefix.set("")
	@page.txtUsername.set("")
	@page.txtPassword.set("")
	@page.txtDomain.set("")
	#step 'I uncheck auto-connect checkbox'
	step 'I tap save to see dashboard'
end

Then(/^I enter OM credentials$/) do
	@page.txtPrefix.set(Account::Creds::PREFIX)
	@page.txtUsername.set(Account::Creds::USERNAME)
	@page.txtPassword.set(Account::Creds::PASSWORD)
	@page.txtDomain.set(Account::Creds::DOMAIN)
end

Then(/^I check auto-connect checkbox$/) do
	checked = @page.chkAutoconnect.isChecked()
	if checked
		puts "checkbox is checked"
	else
		@page.chkAutoconnect.tap()
	end
end

Then(/^I uncheck auto-connect checkbox$/) do
	checked = @page.chkAutoconnect.isChecked()
	if !checked
		puts "Seems like the checkbox is un-checked"
	else
		@page.chkAutoconnect.tap()
	end
end

Then(/^I tap save to see dashboard$/) do
	@page.btnSave.tap()
	#begin
	#	@page = Base.new.Page(Account::CredentialSaveError)
	#	@page.pageExists
	#	@page.btnOK.tap()
	#rescue => e
		#puts e.message
	#end
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end

Then(/^I tap save to see option network UI$/) do
	@page.btnSave.tap
	#begin
		#@page = Base.new.Page(Account::CredentialSaveError)
		#@page.pageExists
		#@page.btnOK.tap()
	#rescue => e
		#puts e.message
	#send
	@page = Base.new.Page(OptionNetwork)
	@page.pageExists
end

Then(/I tap save to see wifi security view/) do
	@page.btnSave.tap()
	begin
		@page = Base.new.Page(Account::CredentialSaveError)
		@page.pageExists
		@page.btnOK.tap()
	rescue => e
		#puts e.message
	end
	@page = Base.new.Page(DashBoard::NetworkSecurityKey)
	@page.pageExists
end

Then(/^I verify if the credentials are saved$/) do
	prefix = @page.txtPrefix.getText; username = @page.txtUsername.getText; domain = @page.txtDomain.getText
	if !(prefix === Account::Creds::PREFIX)
		raise "prefix values dont match, got -#{prefix}- when -#{Account::Creds::PREFIX}- was expected"
		elsif !(username === Account::Creds::USERNAME)
			raise "username values dont match, got -#{username}- when -#{Account::Creds::USERNAME}- was expected"
			elsif !(domain == Account::Creds::DOMAIN)
				raise "domain values dont match, got -#{domain}- when -#{Account::Creds::DOMAIN}- was expected"
	else
		puts "Found credentials"
	end
end

Then(/^I tap cancel button on account settings view$/) do
	@page.btnCancel.tap()
	sleep 4
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end	

Then(/^I tap save button on account settings view$/) do
    @page.btnSave.tap()
    sleep 22
	@page = Base.new.Page(Account::CredentialSaveError)
	@page.pageExists
end

Then(/^I tap save on account settings$/) do
	 @page.btnSave.tap()
	 @page = Base.new.Page(DashBoard)
	 @page.pageExists
end

Then(/^I enter 32 characters into account settings fields$/) do
	text = MathRandom.new.GenRandom(32)
    @page.txtPrefix.set(text)
	@page.txtUsername.set(text)
	@page.txtPassword.set(text)
	@page.txtDomain.set(text)
end

Then(/^I enter android "([^\"]*)" in account settings view$/) do |arg|
    case arg
	when "prefix"
		@page.txtPrefix.set(Account::WrongCreds::PREFIX)
	when "username"
		@page.txtUsername.set(Account::WrongCreds::USERNAME)
	when "password"
		@page.txtPassword.set(Account::WrongCreds::PASSWORD)
	when "domain"
		@page.txtDomain.set(Account::WrongCreds::DOMAIN)
	else
		raise "Invalid field - #{arg}"
	end
end

Then(/^I enter username "([^\"]*)" in account settings view$/) do |arg1|
    @page.txtUsername.tap()
    @page.txtUsername.set("")
    res = @page.txtUsername.set(arg1)
    @page = Base.new.Page(Account::WarnMessage)
    @page.pageExists
end

Then(/^I enter "([^\"]*)" into username field$/) do |arg1|
    @page.txtUsername.set(arg1)
    @page = Base.new.Page(Account)
    @page.pageExists
end

Then(/^I tap ok button on warning message view$/) do
	@page.btnOK.tap()
	@page = Base.new.Page(Account)
	@page.pageExists
end

Then(/^I verify if the credentials are saved after activating via activation wizard$/) do
	accUsername = @page.txtUsername.getText; accDomain = @page.txtDomain.getText
	if !(accUsername === ActivationWizard::Creds::VALID_USERNAME)
		raise "username values dont match"
		elsif !(accDomain === ActivationWizard::Creds::VALID_DOMAIN)
			raise "domain values dont match"
	else
		puts "Credentails saved successfully"
	end
end

Then(/^I verify if the prefix value is as configured in the xml$/) do
	text = @page.txtPrefix.getText
	if text === ActivationWizard::Creds::PREFIX
		puts "Prefix is as configured in the xml"
	else
		raise "Error - Prefix doesn't match what's configured in the xml"
	end
end

Then(/^I should not see any credentials populated on the account view$/) do
	username = @page.txtUsername.getText; password = @page.txtPassword.getText; domain = @page.txtDomain.getText;
	if username == ""
		if password == ""
			if domain == ""
				puts "Account view isn't populated with credentials"
			else
				raise "Domain field isn't nil, populated with text - #{domain}"
			end
		else
			raise "password field isn't nil, populated with text - #{password}"
		end
	else
		raise "username field isn't nil, populated with text - #{username}"
	end
end