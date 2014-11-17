##Class
class ActivationWizard

	def initialize
		@@logger.getLogger(ActivationWizard.name)
	end

	class Creds
		PREFIX = "IPASS/"; VALID_EMAIL = "joe.1@mmm.com";  INVALID_EMAIL = "joe.1@rhii.com"; VALID_USERNAME = "joe.1"; VALID_PASSWORD = "joe.1"; VALID_DOMAIN = "mmm.com"; 
		INVALID_USERNAME = "user"; INVALID_PASSWORD = "user"; INVALID_DOMAIN = "user.com"; NO_FAV_PROFILE_EMAIL = "joe.1@imerys.com"; NO_FAV_USER = "joe.1";
		NO_FAV_PASSWORD = "joe.1"; NO_FAV_DOMAIN = "imerys.com"; BLOCK_EMAIL = "joe.1@hitnetra.hi"; BLOCK_DOMAIN = "hitnetra.hi"; INVALID_FORMAT_EMAIL = "test.com";
	end

	class EmailPage
		attr_accessor :lblTitle, :lblMessage, :txtEmail, :btnContinue, :lblEmailError

		TITLE = "Get Started"
		MESSAGE = "First, we have to find out who you work for--please enter your company email below and we’ll do the rest."
		EMAIL_PLACEHOLDER = "Email"
		CONTINUE = "Continue"
		EMAIL_ERROR = "Please enter a full email address."

		def initialize
			@lblTitle = CalLabel.new("* id:'action_bar_title'")
			@lblMessage = CalWebView.new("return document.getElementById('emailLabel')")   #"return document.getElementById('emailLabel').DATA"  #.textContent
			@txtEmail = CalWebView.new("return document.getElementById('email')")    #"return document.getElementById('email').DATA" #.placeholder
			@btnContinue = CalWebView.new("return document.querySelector(\"*[id='emailButton']\")")    #"return document.querySelector(\"*[id='emailButton']\").DATA" #.value
			@lblEmailError = CalWebView.new("return document.getElementById('emailValidation')") #"return document.getElementById('emailValidation').DATA"
		end
		
		def pageExists
			EmailPage.new.lblMessage.waitForPageToLoad
		end
	end

	class AccountPage
		attr_accessor :lblTitle, :lblMessage, :txtUsername, :txtPassword, :txtDomain, :btnContinue, :lblUsernameErrror, :lblPasswordError, :lblDomainError 

		TITLE = "Get Started"
		MESSAGE_COMPANYFOUND = "That was easy! We found your company. All you have to do now is enter your iPass account information. If you're not sure what to enter, try your company login or ask the friendly people in your IT department."
		MESSAGE_COMPANYNOTFOUND = "Let's try your iPass account information. If you're not sure what this is, you could try your company login or ask the friendly folks in IT to help you."
		USERNAME = "Username"
		PASSWORD = "Password"
		CONTINUE = "Continue"
		VALID_DOMAIN = "mmm.com"
		USERNAME_ERROR = "Please enter a valid username"
		PASSWORD_ERROR = "Please enter a valid password."
		DOMAIN_ERROR = "Please enter a valid domain."

		def initialize
			@lblTitle = CalLabel.new("* id:'action_bar_title'")
			@lblMessage = CalWebView.new("return document.getElementById('accountLabel')")
			@txtUsername = CalWebView.new("return document.getElementById('username')")
			@txtPassword = CalWebView.new("return document.getElementById('password')")
			@txtDomain = CalWebView.new("return document.getElementById('domain')")
			#@btnContinue = CalWebView.new("return document.querySelector(\"*[id='account'] *[name='submitAccount']\")")
			@btnContinue = CalWebView.new("return document.querySelector(\"*[id='account'] *[type='submit']\")") #Locator updated to fix a bug
			@lblUsernameErrror = CalWebView.new("return document.getElementById('usernameValidationFailed')")
			@lblPasswordError = CalWebView.new("return document.getElementById('passwordValidationFailed')")
			@lblDomainError = CalWebView.new("return document.getElementById('domainValidationFailed')")
		end

		def pageExists
			AccountPage.new.txtUsername.waitForPageToLoad
		end
	end

	class FinishPage
		attr_accessor :lblTitle, :lblMessage, :btnFinish

		TITLE = "Get Started"
		MESSAGE = "Congrats! You're ready to connect with iPass."
		FINISH = "Finish"

		def initialize
			@lblTitle = CalLabel.new("* id:'action_bar_title'")
			@lblMessage = CalWebView.new("return document.querySelector(\"*[class='ui-page ui-body-c ui-page-active'] *[class='Status-text2']\")")
			@btnFinish = CalWebView.new("return document.querySelector(\"*[id='confirmActivationDiv'] *[name='submit']\")")
		end

		def pageExists
			FinishPage.new.btnFinish.waitForPageToLoad
		end
	end

	class WrongAccountInfoError
		attr_accessor :lblTitle, :lblRetryMessage, :btnRetry, :lblContinueMessage, :btnContinue

		TITLE = "Oops! That didn't work..."
		RETRY_MESSAGE = "Did you enter the wrong account info?"
		RETRY = "Retry"
		CONTINUE_MESSAGE = "No worries, you can still get started with our app and enter your account information in Settings later."
		CONTINUE = "Continue"
		
		def initialize
			@lblTitle = CalWebView.new("return document.querySelector(\"*[id='popup_authrejected_companyresolved_profileFound'] *[class='head-label']\")")
			@lblRetryMessage = CalWebView.new("return document.querySelector(\"*[id='popup_authrejected_companyresolved_profileFound'] *[class='dialog-text']:nth-child(1)\")")
			@btnRetry = CalWebView.new("return document.getElementById('AccountRetry')")
			@lblContinueMessage = CalWebView.new("return document.querySelector(\"*[id='popup_authrejected_companyresolved_profileFound'] *[class='Dialog']:nth-child(1) *[class='dialog-text']\")")
			@btnContinue = CalWebView.new("return document.querySelector(\"*[class='Dialog'] *[name=submitAccount]\")")

			@@logger = OMLogger.getLogger(WrongAccountInfoError.name)
		end
	
		def pageExists
			WrongAccountInfoError.new.btnRetry.waitForPageToLoad
		end
	end

	class WrongEmailError
		attr_accessor :lblTitle, :lblRetryMessage, :btnRetry, :lblContinueMessage, :btnContinue

		TITLE = "Oops! That didn't work..."
		RETRY_MESSAGE = "Did you enter the wrong account info?"
		RETRY = "Retry"
		CONTINUE_MESSAGE = "No worries, you can still get started with our app and enter your account information in Settings later."
		CONTINUE = "Continue"
		
		def initialize
			@lblTitle = CalWebView.new("return document.querySelector(\"*[id='popup_authrejected_companyresolved_profilenofavorite'] *[class='head-label']\")")
			@lblRetryMessage = CalWebView.new("return document.querySelector(\"*[id='popup_authrejected_companyresolved_profilenofavorite'] *[class='dialog-text']:nth-child(1)\")")
			@btnRetry = CalWebView.new("return document.getElementById('AccountRetryCompanyResolvedNoFavorite')")
			@lblContinueMessage = CalWebView.new("return document.querySelector(\"*[id='popup_authrejected_companyresolved_profilenofavorite'] *[class='Dialog'] *[class='dialog-text']:nth-child(4)\")")
			@btnContinue = CalWebView.new("return document.querySelector(\"*[id='popup_authrejected_companyresolved_profilenofavorite'] input[type='submit']\")")

			@@logger = OMLogger.getLogger(WrongEmailError.name)
		end
	
		def pageExists
			WrongEmailError.new.btnRetry.waitForPageToLoad
		end
	end

	class CompanyNotFoundError
		attr_accessor :lblTitle, :lblRetryMessage, :btnRetry, :lblContinueMessage, :btnContinue

		TITLE = "Oops! That didn't work..."
		#RETRY_MESSAGE = "We couldn't find your company using joe.1@rhii.com\n\t\t\t\t\t\t\t\t\t. Maybe you mistyped it?"
		RETRY_MESSAGE = "We couldn't find your company using joe.1@rhii.com. Maybe you mistyped it?"
		RETRY = "Retry"
		CONTINUE_MESSAGE = "Or we can try something else."
		CONTINUE = "Continue"
		
		def initialize
			@lblTitle = CalWebView.new("return document.querySelector(\"*[id='popup_CompanyNotFound'] *[class='head-label']\")")
			@lblRetryMessage = CalWebView.new("return document.querySelector(\"*[id='popup_CompanyNotFound'] *[class='dialog-text']\")")
			@btnRetry = CalWebView.new("return document.getElementById('Retry')")
			@lblContinueMessage = CalWebView.new("return document.querySelector(\"*[id='popup_CompanyNotFound'] *[class='Dialog']:nth-child(3) *[class='dialog-text']\")")
			@btnContinue = CalWebView.new("return document.querySelector(\"*[id='popup_CompanyNotFound'] *[name='submit']\")")

			@@logger = OMLogger.getLogger(CompanyNotFoundError.name)
		end
	
		def pageExists
			CompanyNotFoundError.new.btnRetry.waitForPageToLoad
		end
	end

	class NoFavouriteProfile
		attr_accessor :lblTitle, :lblMessage, :btnContinue

		TITLE = "Good news bad news..."
		MESSAGE = "We found your account but you may not have all of the perks that you deserve. Let your friendly IT department know that you couldn’t get full access, and they should be able to fix things."
		CONTINUE = "Continue"

		def initialize
			@lblTitle = CalWebView.new("return document.querySelector(\"*[class*='ui-page-active'] *[class='label-text']:nth-child(1)\")")
			@lblMessage = CalWebView.new("return document.querySelector(\"*[class*='ui-page-active'] *[class='label-text']:nth-child(2)\")")
			@btnContinue = CalWebView.new("return document.querySelector(\"*[id=confirmActivationDiv] *[name='submit']\")")

			@@logger = OMLogger.getLogger(NoFavouriteProfile.name)
		end
		
		def pageExists
			NoFavouriteProfile.new.lblTitle.waitForPageToLoad
		end
	end

	class ContactIpassError
		attr_accessor :lblTitle, :lblRetryMessage, :btnRetry, :lblContinueMessage, :btnContactIpass

		TITLE = "Oops! That didn't work..."
		RETRY_MESSAGE = "Did you enter the wrong account info?"
		RETRY = "Retry"
		CONTINUE_MESSAGE = "Do you need help? We're here for you!"
		CONTACT_IPASS = "Contact iPass"
		
		def initialize
			@lblTitle = CalWebView.new("return document.querySelector(\"*[id='popupShowContactiPass'] *[class='head-label']\")")
			@lblRetryMessage = CalWebView.new("return document.querySelector(\"*[id='popupShowContactiPass'] *[class='dialog-text']\")")
			@btnRetry = CalWebView.new("return document.getElementById('AccountRetryContactiPass')")
			@lblContinueMessage = CalWebView.new("return document.querySelector(\"*[id='popupShowContactiPass'] form div:nth-child(4) *[class='dialog-text']\")")
			@btnContactIpass = CalWebView.new("return document.querySelector(\"*[id='popupShowContactiPass'] *[name='submit']\")")

			@@logger = OMLogger.getLogger(ContactIpassError.name)
		end
	
		def pageExists
			ContactIpassError.new.btnRetry.waitForPageToLoad
		end
	end

	class ContactIpass
		attr_accessor :lblMessage, :lblEmail

		MESSAGE = "We can't wait to get you started with iPass! We're looking into this and will get back to you as soon as possible."
		#EMAIL = "We'll contact you at this address: \n\t\t\t\t\t \n\t\t\t\t\tjoe.1@rhii.com"
		EMAIL = "We'll contact you at this address:  joe.1@rhii.com"

		def initialize
			@lblMessage = CalWebView.new("return document.querySelector(\"*[class*='ui-page-active'] *[class='label-text']:nth-child(1)\")")
			@lblEmail = CalWebView.new("return document.querySelector(\"*[class*='ui-page-active'] *[class='label-text']:nth-child(2)\")")
		end

		def pageExists
			ContactIpass.new.lblEmail.waitForPageToLoad
		end
	end

	class BlockCompany
		attr_accessor :lblMessage

		MESSAGE = "Oops! Unfortunately, you've been blocked from using the iPass app by your admin. Check in with them for more details."

		def initialize
			@lblMessage = CalWebView.new("return document.querySelector(\"*[class*='ui-page-active'] *[class='label-text']\")")

			@@logger = OMLogger.getLogger(BlockCompany.name)
		end

		def pageExists
			BlockCompany.new.lblMessage.waitForPageToLoad
		end
	end

	class RememberCredentialsDialog
		attr_accessor :btnNever

		def initialize
			@btnNever = CalButton.new("* id:'button2'")

			@@logger = OMLogger.getLogger(RememberCredentialsDialog.name)
		end

		def pageExists
			RememberCredentialsDialog.new.btnNever.waitTillAppears
		end
	end

end# class ends

##Class Defns
class ActivationWizardDefns

	def self.HandleRememberPasswordDialog
		@page = Base.new.Page(ActivationWizard::RememberCredentialsDialog)
		puts "Entered HandleRememberPasswordDialog"
		btnNever = ActivationWizard::RememberCredentialsDialog.new.btnNever
		2.times do
			puts btnNever.isElementPresent
			if btnNever.isElementPresent
				btnNever.tap
				break
			else
				puts "Remember password dialog not seen"
				sleep 2
			end
		end
		sleep 2
	end
end

##Step Defns##

##Email Page##
Then(/^I assert all elements on the email page$/) do
	_Title = ActivationWizard::EmailPage::TITLE; _Message = ActivationWizard::EmailPage::MESSAGE; _Email_Placeholder = ActivationWizard::EmailPage::EMAIL_PLACEHOLDER;
	_Continue = ActivationWizard::EmailPage::CONTINUE

	h = {_Title => @page.lblTitle.getText, _Message => @page.lblMessage.getTextContent, _Email_Placeholder => @page.txtEmail.getPlaceholder, 
		_Continue => @page.btnContinue.getValue}
	Calx.new.AssertTextAll(h)
end

Then(/I enter an invalid email format on the email page/) do
	@page.txtEmail.set(ActivationWizard::Creds::INVALID_FORMAT_EMAIL)
end

Then(/^I enter a valid email on the email page$/) do
	@page.txtEmail.set(ActivationWizard::Creds::VALID_EMAIL)
end

Then(/^I enter an invalid email address on the email page$/) do
	@page.txtEmail.set(ActivationWizard::Creds::INVALID_EMAIL)
end

Then(/^I assert the error shown for an invalid email id$/) do
	_Error = ActivationWizard::EmailPage::EMAIL_ERROR
	h = {_Error => @page.lblEmailError.getTextContent}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap continue to see email validation error$/) do
	@page.btnContinue.tap
end

Then(/^I tap continue to see account page$/) do
	@page.btnContinue.tap
	@page = Base.new.Page(ActivationWizard::AccountPage)
	@page.pageExists
end

##Account Page##
Then(/^I assert all elements on the account page$/) do
	_Title = ActivationWizard::AccountPage::TITLE; _Message = ActivationWizard::AccountPage::MESSAGE_COMPANYFOUND; _Username = ActivationWizard::AccountPage::USERNAME;
	_Password = ActivationWizard::AccountPage::PASSWORD; _Continue = ActivationWizard::AccountPage::CONTINUE;
	h = {_Title => @page.lblTitle.getText, _Message => @page.lblMessage.getTextContent, _Username => @page.txtUsername.getPlaceholder, _Password => @page.txtPassword.getPlaceholder,
		_Continue => @page.btnContinue.getValue}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on the account page when the company is not found$/) do
	_Title = ActivationWizard::AccountPage::TITLE; _Message = ActivationWizard::AccountPage::MESSAGE_COMPANYNOTFOUND; _Username = ActivationWizard::AccountPage::USERNAME;
	_Password = ActivationWizard::AccountPage::PASSWORD; _Continue = ActivationWizard::AccountPage::CONTINUE;
	h = {_Title => @page.lblTitle.getText, _Message => @page.lblMessage.getTextContent, _Username => @page.txtUsername.getPlaceholder, _Password => @page.txtPassword.getPlaceholder,
		_Continue => @page.btnContinue.getValue}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap continue to see an error$/) do
	@page.btnContinue.tap
end

Then(/^I assert the error shown for username field$/) do
	_UsernameError = ActivationWizard::AccountPage::USERNAME_ERROR
	h = {_UsernameError => @page.lblUsernameErrror.getTextContent}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert the error shown for password field$/) do
	_PasswordError = ActivationWizard::AccountPage::PASSWORD_ERROR
	h = {_PasswordError => @page.lblPasswordError.getTextContent}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert the error shown for domain field$/) do
	_DomainError = ActivationWizard::AccountPage::DOMAIN_ERROR
	h = {_DomainError => @page.lblDomainError.getTextContent}
	Calx.new.AssertTextAll(h)
end

Then(/^I enter a valid username on the account page$/) do
	@page.txtUsername.set(ActivationWizard::Creds::VALID_USERNAME)
end

Then(/^I enter a valid password on the account page$/) do
	@page.txtPassword.set(ActivationWizard::Creds::VALID_PASSWORD)
end

Then(/^I enter a valid domain on the account page$/) do
	@page.txtDomain.set(ActivationWizard::Creds::VALID_DOMAIN)
end

Then(/^I enter a empty value for domain on the account page$/) do
	@page.txtDomain.set("")
end

Then(/^I tap continue to see finish page$/) do
	@page.btnContinue.tap
	ActivationWizardDefns.HandleRememberPasswordDialog()
	@page = Base.new.Page(ActivationWizard::FinishPage)
	@page.pageExists
end

##Finish Page##
Then(/^I assert all elements on the finish page$/) do
	_Title = ActivationWizard::FinishPage::TITLE; _Message = ActivationWizard::FinishPage::MESSAGE; _Finish = ActivationWizard::FinishPage::FINISH
	h = {_Title => @page.lblTitle.getText, _Message => @page.lblMessage.getTextContent, _Finish => @page.btnFinish.getValue}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap finish on activation finish page to see dashboard$/) do
	@page.btnFinish.tap
	step 'I tap lets start on travel preference view'
end

###Error Views###

Then(/^I enter invalid username on the account page$/) do
	@page.txtUsername.set(ActivationWizard::Creds::INVALID_USERNAME)
end

Then(/^I enter invalid password on the account page$/) do
	@page.txtPassword.set(ActivationWizard::Creds::INVALID_PASSWORD)
end

Then(/^I enter invalid domain on the account page$/) do
	@page.txtDomain.set(ActivationWizard::Creds::INVALID_DOMAIN)
end

Then(/^I tap continue on account page to see wrong account info error for a favourite profile$/) do
	@page.btnContinue.tap
	ActivationWizardDefns.HandleRememberPasswordDialog()
	@page = Base.new.Page(ActivationWizard::WrongAccountInfoError)
	@page.pageExists
end

Then(/^I tap continue on account page to see wrong account info error for a generic profile$/) do
	@page.btnContinue.tap
	ActivationWizardDefns.HandleRememberPasswordDialog()
	@page = Base.new.Page(ActivationWizard::WrongEmailError)
	@page.pageExists
end

Then(/^I tap continue on email page to see company not found error$/) do
	@page.btnContinue.tap
	@page = Base.new.Page(ActivationWizard::CompanyNotFoundError)
	@page.pageExists
end

Then(/^I tap continue on account page to see contact ipass error$/) do
	@page.btnContinue.tap
	ActivationWizardDefns.HandleRememberPasswordDialog()
	@page = Base.new.Page(ActivationWizard::ContactIpassError)
	@page.pageExists
end

Then(/^I assert all elements on the error shown when invalid credentials are entered for a favourite profile$/) do
	_Title = ActivationWizard::WrongAccountInfoError::TITLE; _Retry_Message = ActivationWizard::WrongAccountInfoError::RETRY_MESSAGE; _Retry = ActivationWizard::WrongAccountInfoError::RETRY;
	_ContinueMessage = ActivationWizard::WrongAccountInfoError::CONTINUE_MESSAGE; _Continue = ActivationWizard::WrongAccountInfoError::CONTINUE
	h = {_Title => @page.lblTitle.getTextContent, _Retry_Message => @page.lblRetryMessage.getTextContent, _Retry => @page.btnRetry.getTextContent, _ContinueMessage => @page.lblContinueMessage.getTextContent,
		_Continue => @page.btnContinue.getValue}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on the error shown when invalid credentials are entered for a generic profile$/) do
	_Title = ActivationWizard::WrongEmailError::TITLE; _Retry_Message = ActivationWizard::WrongEmailError::RETRY_MESSAGE; _Retry = ActivationWizard::WrongEmailError::RETRY;
	_ContinueMessage = ActivationWizard::WrongEmailError::CONTINUE_MESSAGE; _Continue = ActivationWizard::WrongEmailError::CONTINUE
	h = {_Title => @page.lblTitle.getTextContent, _Retry_Message => @page.lblRetryMessage.getTextContent, _Retry => @page.btnRetry.getTextContent, _ContinueMessage => @page.lblContinueMessage.getTextContent,
		_Continue => @page.btnContinue.getValue}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on the error shown when the company is not found$/) do
	_Title = ActivationWizard::CompanyNotFoundError::TITLE; _Retry_Message = ActivationWizard::CompanyNotFoundError::RETRY_MESSAGE; _Retry = ActivationWizard::CompanyNotFoundError::RETRY;
	_ContinueMessage = ActivationWizard::CompanyNotFoundError::CONTINUE_MESSAGE; _Continue = ActivationWizard::CompanyNotFoundError::CONTINUE
	
	##Handle string with spaces in between
	res = @page.lblRetryMessage.getTextContent
	if res.include?("\n\t")
		res = res.gsub(/\n\t+/, "")
	end
	#puts "str1 --> #{_Retry_Message}"
	#puts "str2 --> #{res}"

	h = {_Title => @page.lblTitle.getTextContent, _Retry_Message => res, _Retry => @page.btnRetry.getTextContent, _ContinueMessage => @page.lblContinueMessage.getTextContent,
		_Continue => @page.btnContinue.getValue}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on the contact ipass error$/) do
	_Title = ActivationWizard::ContactIpassError::TITLE; _Retry_Message = ActivationWizard::ContactIpassError::RETRY_MESSAGE; _Retry = ActivationWizard::ContactIpassError::RETRY;
	_ContinueMessage = ActivationWizard::ContactIpassError::CONTINUE_MESSAGE; _Contact_Ipass = ActivationWizard::ContactIpassError::CONTACT_IPASS

	h = {_Title => @page.lblTitle.getTextContent, _Retry_Message => @page.lblRetryMessage.getTextContent, _Retry => @page.btnRetry.getTextContent, _ContinueMessage => @page.lblContinueMessage.getTextContent,
		_Contact_Ipass => @page.btnContactIpass.getValue}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on the contact ipass page$/) do
	_Message = ActivationWizard::ContactIpass::MESSAGE; _Email = ActivationWizard::ContactIpass::EMAIL

	res = @page.lblEmail.getTextContent
	if res.include?("\n\t")
		res = res.gsub(/\n\t+/, "")
	end

	h = {_Message => @page.lblMessage.getTextContent, _Email => res}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap retry to see account page$/) do
	@page.btnRetry.tap
	@page = Base.new.Page(ActivationWizard::AccountPage)
	@page.pageExists
end

Then(/^I tap retry on company not found error to see email page$/) do
	@page.btnRetry.tap
	@page = Base.new.Page(ActivationWizard::EmailPage)
	@page.pageExists
end

Then(/^I tap continue on company not found error to see account page$/) do
	@page.btnContinue.tap
	@page = Base.new.Page(ActivationWizard::AccountPage)
	@page.pageExists
end

Then(/^I tap continue to see dashboard$/) do
	@page.btnContinue.tap
	step 'I tap lets start on travel preference view'
end

Then(/^I tap retry on contact ipass error to see account page$/) do
	@page.btnRetry.tap
	@page = Base.new.Page(ActivationWizard::AccountPage)
	@page.pageExists
end

Then(/^I tap contact ipass on the error to see contact ipass page$/) do
	@page.btnContactIpass.tap
	@page = Base.new.Page(ActivationWizard::ContactIpass)
	@page.pageExists
end

###No Favourite Profile###

Then(/^I enter no favourite profile on the email page$/) do
	@page.txtEmail.set(ActivationWizard::Creds::NO_FAV_PROFILE_EMAIL)
end

Then(/^I enter no favourite username on the account page$/) do
	@page.txtUsername.set(ActivationWizard::Creds::NO_FAV_USER)
end

Then(/^I enter no favourite password on the account page$/) do
	@page.txtPassword.set(ActivationWizard::Creds::NO_FAV_PASSWORD)
end

Then(/^I enter no favourite domain on the account page$/) do
	@page.txtDomain.set(ActivationWizard::Creds::NO_FAV_DOMAIN)
end

Then(/^I tap continue on account page to see no favourite profile page$/) do
	@page.btnContinue.tap
	ActivationWizardDefns.HandleRememberPasswordDialog()
	@page = Base.new.Page(ActivationWizard::NoFavouriteProfile)
	@page.pageExists
end

Then(/^I assert all elements on the no favourite profile page$/) do
	_Title = ActivationWizard::NoFavouriteProfile::TITLE; _Message = ActivationWizard::NoFavouriteProfile::MESSAGE; _Continue = ActivationWizard::NoFavouriteProfile::CONTINUE;
	h = {_Title => @page.lblTitle.getTextContent, _Message => @page.lblMessage.getTextContent, _Continue => @page.btnContinue.getValue}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap continue on no favourite profile page to see dashboard$/) do
	@page.btnContinue.tap
	step 'I tap lets start on travel preference view'
end

##Block Company##

Then(/^I enter block email on the email page$/) do
	@page.txtEmail.set(ActivationWizard::Creds::BLOCK_EMAIL)
end

Then(/^I enter block domain on the account page$/) do
	@page.txtDomain.set(ActivationWizard::Creds::BLOCK_DOMAIN)
end

Then(/^I tap continue on email page to see company block page$/) do
	@page.btnContinue.tap
	@page = Base.new.Page(ActivationWizard::BlockCompany)
	@page.pageExists
end

Then(/^I assert all elements on the company block message$/) do
	_Message = ActivationWizard::BlockCompany::MESSAGE
	h = {_Message => @page.lblMessage.getTextContent}
	Calx.new.AssertTextAll(h)
end

