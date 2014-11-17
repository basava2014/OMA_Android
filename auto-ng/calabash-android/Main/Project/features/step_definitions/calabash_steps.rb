#require 'calabash-android/calabash_steps'

calObj = Calx.new
netObj = Network.new
				  
When(/^I tap "([^\"]*)"$/) do |arg|
	calObj.Tap(arg)
end

Then(/^I have to see "([^\"]*)"$/) do |arg|
	calObj.AssertText(arg, true)
end

Then(/^I should not see text "([^\"]*)"$/) do |arg|
	calObj.AssertText(arg, false)
end

Then(/^I enter "([^\"]*)" into "([^\"]*)" field$/) do |text, field|
	calObj.SetText(text, field)
end

Then(/^I verify if the client is connected$/) do
	netObj.IsConnected()
end

Then(/^I verify if the button "([^\"]*)" is enabled$/) do |arg|
	if calObj.IsEnabled(arg)
		puts "#{arg} button is enabled"
	else
		raise "#{arg} button is disabled"
	end
end

Then(/^I verify if the button "([^\"]*)" is disabled$/) do |arg|
	if !calObj.IsEnabled(arg)
		puts "#{arg} button is enabled"
	else
		raise "#{arg} button is disabled"
	end
end

Then(/^I should see "([^\"]*)" option$/) do |arg|
	if calObj.IsElementPresent(arg)
		puts "Found #{arg} option on the UI"
	else
		raise "Couldn't not find #{arg} option on the UI"
	end
end

Then(/^I should not see "([^\"]*)" option$/) do |arg|
	if !calObj.IsElementPresent(arg)
		puts "Couldn't not find #{arg} option on the UI"
	else
		raise "Found #{arg} option on the UI"
	end
end

