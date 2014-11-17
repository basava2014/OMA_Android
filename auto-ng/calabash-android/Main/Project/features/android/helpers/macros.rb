
Then(/^I navigate to activation code (?:UI|ui)$/) do
	macro 'I tap activation code'
	macro 'I assert all elements on preactivation screen'
	macro 'I enter dummy profileid and tap verify now'
	macro 'I assert the continue messsage on the preactivation screen'
	macro 'I tap continue on preactivation page'
end

Then(/^I activate the client with regular profile id$/) do
	macro 'I tap activation code'
	macro 'I enter dummy profileid and tap verify now'
	macro 'I tap continue on preactivation page'
	macro 'I enter regular profileid and tap ok'
end

Then(/^I activate the client with favorite profile id$/) do
	macro 'I tap activation code'
	macro 'I enter dummy profileid and tap verify now'
	macro 'I tap continue on preactivation page'
	macro 'I enter favorite profileid and tap ok'
end

Then(/^I activate the client with generic profile id$/) do
	macro 'I tap activation code'
	macro 'I enter dummy profileid and tap verify now'
	macro 'I tap continue on preactivation page'
	macro 'I enter generic profileid and tap ok'
end

Then(/^I activate the client with no wifi profile id$/) do
	macro 'I tap activation code'
	macro 'I enter dummy profileid and tap verify now'
	macro 'I tap continue on preactivation page'
	macro 'I enter nowifi profileid and tap ok'
end

Then(/^I verify welcome screen$/) do
	arr = ["TXT_WELCOME_TITLE", "TXT_WELCOME_MESSAGE", "TXT_WELCOME_GETSTARTED", "TXT_WELCOME_ACTIVATIONCODE", "TXT_WELCOME_PRIVACYPOLICY", "TXT_WELCOME_ACTIVATELATER"]

	calObj = Calx.new
	calObj.AssertTextAll(arr)
end