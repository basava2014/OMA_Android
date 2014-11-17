######Classes######

class Welcome
	attr_accessor :btnTitle, :btnGetStarted, :btnActivationCode, :btnPrivacyPolicy, :btnActivateLater, :lblWelcomeTitle, :lblWelcomeMessage, :btnSettings

	TITLE = "iPass"
	GETSTARTED = "Get Started"
	ACTIVATIONCODE = "Activation Code"
	PRIVACYPOLICY = "Privacy Policy"
	ACTIVATELATER = "Activate Later"
	WELCOMETITLE = "Welcome to the world of Wi-Fi."
	WELCOMEMESSAGE = "Let's get connected!"

	def initialize
		@btnTitle = CalButton.new("* id:'action_bar_title'")

		@btnGetStarted = CalButton.new("* id:'btn_activateEmail'")
		@lblWelcomeTitle = CalLabel.new("* id:'welcome_title'")
		@btnActivationCode = CalButton.new("* id:'btn_activateCode'")
		@btnPrivacyPolicy = CalButton.new("* id:'btn_privacyPolicy'")
		@btnActivateLater = CalButton.new("* id:'btn_activate_later'")
		@lblWelcomeMessage = CalLabel.new("* id:'welcome_text_message'")
		@btnSettings = CalButton.new("OverFlowMenuButton'")

		@@logger = OMLogger.getLogger(Welcome.name)
	end

	def pageExists()
		Welcome.new.btnGetStarted.waitShort()
	end

	class Settings
		attr_accessor :btnSendLogs

		SENDLOGS = "Send Logs"
		
		def initialize
			@btnSendLogs = CalButton.new("* id:'title'")
			
			@@logger = OMLogger.getLogger(Settings.name)
		end
	
		def pageExists()
			Settings.new.btnSendLogs.waitTillAppears()
		end
	end

	class ActivateLaterMessage
		attr_accessor :lblTitle, :lblMessage, :btnOK

		TITLE = "iPass Open Mobile"
		MESSAGE = "To activate iPass Open Mobile later, tap the Menu button and select Activate."
		BUTTON = "OK"

		def initialize
			@lblTitle = CalLabel.new("* id:'alertTitle'")
			@lblMessage = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button1'")

			@@logger = OMLogger.getLogger(ActivateLaterMessage.name)
		end

		def pageExists
			ActivateLaterMessage.new.btnOK.waitTillAppears()
		end
	end
end

class WelcomePageDefns
end

######Steps######

Given(/^I am on welcome screen$/) do
	@page = Base.new.Page(Welcome)
	begin
		@page.pageExists()
	rescue => e
		puts "#{e.message}"
		#clear_app_data
		reinstall_apps
		start_test_server_in_background
		step 'I assert and tap accept'
	end
end

Then(/I assert all elements on welcome screen/) do
	_Title = Welcome::TITLE; _GetStarted = Welcome::GETSTARTED; _WelcomeTitle = Welcome::WELCOMETITLE; _WelcomeMessage = Welcome::WELCOMEMESSAGE; 
	_ActivationCode = Welcome::ACTIVATIONCODE; _PrivacyPolicy = Welcome::PRIVACYPOLICY; _ActivateLater = Welcome::ACTIVATELATER

	h = {_Title => @page.btnTitle.getText(), _GetStarted => @page.btnGetStarted.getText(), _WelcomeTitle => @page.lblWelcomeTitle.getText(), _WelcomeMessage => @page.lblWelcomeMessage.getText(), 
		  _ActivationCode => @page.btnActivationCode.getText(), _PrivacyPolicy => @page.btnPrivacyPolicy.getText(), _ActivateLater => @page.btnActivateLater.getText() }
	Calx.new.AssertTextAll(h)
end

Then(/^I tap activation code$/) do
	@page.btnActivationCode.tap()
	@page = Base.new.Page(PreActivationCode)
	@page.pageExists()
end

Then(/^I tap settings button on the welcome screen$/) do
	@page.btnSettings.tap()
	@page = Base.new.Page(Welcome::Settings)
	@page.pageExists()
end

Then(/^I assert all settings menu options on welcome page$/) do
	_SendLogs = Welcome::Settings::SENDLOGS
	h = {_SendLogs => @page.btnSendLogs.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on the activation later message$/) do
	_Title = Welcome::ActivateLaterMessage::TITLE; _Message = Welcome::ActivateLaterMessage::MESSAGE; _Button = Welcome::ActivateLaterMessage::BUTTON
	h = {_Title => @page.lblTitle.getText(), _Message => @page.lblMessage.getText(), _Button => @page.btnOK.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap activate later and assert all elements in the (?:UI|ui)$/) do
	@page.btnActivateLater.tap()
	@page = Base.new.Page(Welcome::ActivateLaterMessage)
	@page.pageExists()
	step 'I assert all elements on the activation later message'
end

Then(/^I see the application name in the welcome page$/) do
	_Title = Welcome::TITLE
	h = {_Title => @page.btnTitle.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I activate the app in default mode$/) do
	@page.btnActivateLater.tap()
	@page = Base.new.Page(Welcome::ActivateLaterMessage)
	@page.pageExists()
	step 'I assert all elements on the activation later message'
	@page.btnOK.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists()
end	

Then(/^I tap get started to see email page$/) do
	@page.btnGetStarted.tap
	@page = Base.new.Page(ActivationWizard::EmailPage)
	@page.pageExists
end

Then(/^I tap get started to see internet error message$/) do
	@page.btnGetStarted.tap()
	@page = Base.new.Page(ActivationCode::NoInternetError)
	@page.pageExists()
end
