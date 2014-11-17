require 'calabash-android/operations'
#require_relative '../../lib/calx.rb'

Then(/^I assert all elements on the welcome screen$/) do
	#WelcomePage.new.Await()
	#WelcomePage.new.AssertWelcomeScreen()
end

Then(/I tap Activation Code/) do
	#WelcomePage.new.TapActivationCode()
end

Then(/I should see (["^\"])/) do


	# thes i should see GetStared button






	welcomePage = WelcomePage.new

	welcomePage.btnGetStarted.waitTilAppears()

	puts welcomePage.lblWelcomeTitle.getText()

	puts welcomePage.lblWelcomeMessage.getText()

	welcomePage.btnActivationCode.tap
end
