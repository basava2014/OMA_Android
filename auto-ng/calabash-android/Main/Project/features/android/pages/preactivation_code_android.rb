require_relative '../../lib/objectbase.rb'

#####Classes#####
class PreActivationCode
	attr_accessor :btnVerifyNow, :lblActivationMessage, :btnContinue, :txtProfileId_ActivationCode

	VERIFYNOW = "Verify Now"
	ACTIVATEMESSAGE = "To activate this app you either need Profile ID or Activation Code."
	CONTINUE = "Continue"

	def initialize
		@btnVerifyNow = CalButton.new("* id:'btnVerifyNow'")
		@lblActivationMessage = CalLabel.new("* id:'profile_id_actv_code_lbl'")
		@btnContinue = CalButton.new("* id:'button1'")
		@txtProfileId_ActivationCode = CalText.new("EditText id:'profileid_activationcode_edit'")

		@@logger = OMLogger.getLogger(PreActivationCode.name)
	end

	def pageExists
		PreActivationCode.new.btnVerifyNow.waitTillAppears()
	end

	#NoData class
	class NoDataErrorDialog
		attr_accessor :lblMessage, :btnOK

		MESSAGE = "Please enter your profile ID or Activation code to verify."
		BUTTON = "OK"
	
		def initialize
			@lblMessage = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button1'")

			@@logger = OMLogger.getLogger(PreActivationCode::NoDataErrorDialog.name)
		end

		def pageExists
			NoDataErrorDialog.new.btnOK.waitTillAppears()
		end
	end

	#Continue class
	class ContinueDialog
		attr_accessor :lblMessage, :btnContinue

		MESSAGE = "To activate this app we would like more information."
		BUTTON = "Continue"

		def initialize
			@lblMessage = CalLabel.new("* id:'message'")
			@btnContinue = CalButton.new("* id:'button1'")

			@@logger = OMLogger.getLogger(PreActivationCode::ContinueDialog.name)
		end

		def pageExists
			ContinueDialog.new.btnContinue.waitTillAppears()
		end
	end

end

#####Steps#####
Then(/I assert all elements on preactivation screen/) do
	_VerifyNow = PreActivationCode::VERIFYNOW; _ActivationMessage = PreActivationCode::ACTIVATEMESSAGE;

	h = {_VerifyNow => @page.btnVerifyNow.getText(), _ActivationMessage => @page.lblActivationMessage.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I enter dummy profileid and tap verify now$/) do 
	arg = "00000"
	@page.txtProfileId_ActivationCode.set(arg)
	@page.btnVerifyNow.tap()
	@page = Base.new.Page(PreActivationCode::ContinueDialog)
	@page.pageExists()
end

Then(/^I assert the continue messsage on the preactivation screen$/) do
	_Continue = PreActivationCode::ContinueDialog::BUTTON; _Message = PreActivationCode::ContinueDialog::MESSAGE
	
	h = {_Continue => @page.btnContinue.getText(), _Message => @page.lblMessage.getText()}
	Calx.new.AssertTextAll(h)
end

Then(/^I tap continue on preactivation page$/) do
	@page.btnContinue.tap()
	@page = Base.new.Page(ActivationCode)
	@page.pageExists()
end
