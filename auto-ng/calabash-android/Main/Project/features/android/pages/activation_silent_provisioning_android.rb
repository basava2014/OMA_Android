#Activation silent provisioning

class ActivationBySilentProvision

	#CLIENTX_PROVISION_SILENT = "clientx://provision.com?pid=#{$regular_profile_id}\&test=N\&username=android\&password=iatp@ssword\&domain=ipass.com\&autologin=N\&prefix=IPASS\%\2\F\&obfuscation=Y\&silentmode=Y"
	CLIENTX_PROVISION_SILENT = "clientx://provision.com?pid=#{$regular_profile_id}&test=N&autologin=N&obfuscation=Y&silentmode=Y"
	#CLIENTX_PROVISION = "clientx://provision.com?pid=#{$regular_profile_id}&test=N&autologin=N&obfuscation=Y&username=android&password=iatp@ssword&domain=ipass.com"
	CLIENTX_PROVISION = "clientx://provision.com?pid=#{$regular_profile_id}&test=N&autologin=N&obfuscation=Y&username=android&password=AF55B17F121549EE92C111ADEC26BC7A&domain=iat.ipass.com&prefix=IPASS%2F"
	CLIENTX_PROVISION_PIN = "clientx://provision.com?pid=#{$pin_profile_id}&#{$profile_pin}&test=N&autologin=N&obfuscation=Y"
	CLIENTX_PROVISION_INVALID_PROFILE = "clientx://provision.com?pid=#{$wrong_profile_id}&#{$profile_pin}&test=N&autologin=N&obfuscation=Y"
	CLIENTX_PROVISION_INVALID_PIN = "clientx://provision.com?pid=#{$pin_profile_id}&#{$wrong_profile_pin}&test=N&autologin=N&obfuscation=Y"
	CLIENTX_PROVISION_INVALID = "clientx://provision.com?pid=#{$wrong_profile_id}&test=N&autologin=N&obfuscation=Y"
	CLIENTX_PROVISION__MISCONFIG = "clientx://provision.com?pid=#{$regular_profile_id}&test=N&autologin=N&obfuscation=Y&silentmode=N&username=android&password=iatp@ssword"

	def initialize
		@@logger = OMLogger.getLogger(ActivationBySilentProvision.name)	
	end

	##No Internet Error Message - Reuse class from activation code page

	def self.ActivateClientByHTML(profile)
		ActivationBySilentProvisionDefns.UpdateHTMLwithURL(profile)

		##Kill the html viewer if its running
		 `adb shell am force-stop com.android.htmlviewer`

		adbCommand = "adb shell am start -a android.intent.action.VIEW -n com.android.htmlviewer/.HTMLViewerActivity -d file:///mnt/sdcard/activate.html"
		STDOUT.puts "Executing ADB, to invoke action INTENT"
		STDOUT.puts adbCommand
		`#{adbCommand}`
	end

	class ActivationConfigurationMessage
		attr_accessor :lblTitle, :lblMessage, :btnOK

		TITLE = "Configuring Application"
		MESSAGE = "Please wait while we configure your application."
		OK = "OK"

		def initialize
			@lblTitle = CalLabel.new("* id:'alertTitle'")
			@lblMessage = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button1'")
			
			@@logger = OMLogger.getLogger(ActivationConfigurationMessage.name)
		end

		def pageExists
			ActivationConfigurationMessage.new.lblTitle.waitTillAppears
		end
	end

	class ActivatingMessage
		attr_accessor :lblTitle; :lblMessage

		TITLE = "Activation"
		MESSAGE = "You're almost done! Please wait while we finish setting up your account."

		def initialize
			@lblTitle = CalLabel.new("* id:'alertTitle'")
			@lblMessage = CalLabel.new("* id:'message'")

			@@logger = OMLogger.getLogger(ActivatingMessage.name)
		end

		def pageExists
			ActivatingMessage.new.lblTitle.waitTillAppears
		end
	end

	class InvalidProfileMessage
		attr_accessor :lblTitle, :lblMessage, :btnOK

		TITLE = "Oops!"
		MESSAGE = "There was something wrong with the link or logo you tapped on."
		OK = "OK"

		def initialize
			@lblTitle = CalLabel.new("* id:'alertTitle'")
			@lblMessage = CalLabel.new("* id:'message'")
			@btnOK = CalButton.new("* id:'button1'")

			@@logger = OMLogger.getLogger(InvalidProfileMessage.name)
		end

		def pageExists
			InvalidProfileMessage.new.lblMessage.waitTillAppears
		end
	end
	
	class Notification_NoInternetMessage
		TITLE = "Shoot!"
		MESSAGE = "You have to connect to the Internet."
	end

	class Notification_ActivationCompletedMessage
		TITLE = "Congratulations! iPass is ready to use!."
		MESSAGE = "Tap to launch iPass Open Mobile"
	end

	class Notification_ConfigAppMessage
		TITLE = "Configuring Application"
		MESSAGE = "Tap to launch iPass Open Mobile"
	end

end

class ActivationBySilentProvisionDefns
	
	@@htmlFile = File.join(File.dirname(__FILE__),'../../res/activate.html')

	def initialize
		@@logger = OMLogger.getLogger(ActivationBySilentProvisionDefns.name)
	end

  	def self.UpdateHTMLwithURL(strToReplace)

  		if !File.exists?(@@htmlFile)
  			@@logger.fatal("Couldn't find html file in the res folder")
  		end
  		text = File.read(@@htmlFile)
    	replace = text.gsub(/(?<=url=)(.*?)(?=")/, strToReplace)
    	File.open(@@htmlFile, 'w') { |file| file.puts replace }
  	
    	#push the file to sd card
    	pushCmd = "adb push \"#{@@htmlFile}\" /mnt/sdcard/"
    	STDOUT.puts "Pushing file to --> #{pushCmd}"
    	`#{pushCmd}`
    	sleep 1
  	end

	def self.GetClientNotifications()
		titleCmd = "adb shell dumpsys notification | grep -A 24 -B 0 'com.iPass.OpenMobile' | grep android.title"
		messageCmd = "adb shell dumpsys notification | grep -A 24 -B 0 'com.iPass.OpenMobile' | grep android.text"

		title = `#{titleCmd}`.split("=")[1].strip
		message = `#{messageCmd}`.split("=")[1].strip

		if title.empty?
			@@logger.fatal("Error: Couldn't find any client notifications")
		end

		h = {"title" => "#{title}", "message" => "#{message}"}
		STDOUT.puts("Got notification message as --> #{h}")
		return h
	end

	def self.TapClientNotification
		x =200; y = 200; count = 1;
		cmd = "adb shell dumpsys notification | grep contentIntent"
		res = `#{cmd}`

		arr = res.scan(/\{.*\}/)
		STDOUT.puts "arr --> #{arr}"

		arr.each do |str|
			STDOUT.puts "str in arr --> #{str}"	
			if str.include?"com.iPass.OpenMobile"
				`adb shell input tap #{x} #{y}`
				sleep 2
			else
				#y = y + 100
				count = count + 1
			end
		end
		#raise "Couldn't find any notifications related to OM client" if count == arr.length
	end

end


#### Steps - Activation - Silent provisioning ####
Then(/^I provision the client using custom schema in silent mode$/) do
	begin
		ActivationBySilentProvision.ActivateClientByHTML(ActivationBySilentProvision::CLIENTX_PROVISION_SILENT)
		step 'I wait for 30 seconds'
	rescue => e	
		STDERR.puts e.message
		start_test_server_in_background
	end
	@page = Base.new.Page(TravelPreference)
	step 'I launch OM'
	@page.pageExists
	step 'I tap lets start on travel preference view'
end

Then(/^I provision the client using custom schema$/) do
	begin
		ActivationBySilentProvision.ActivateClientByHTML(ActivationBySilentProvision::CLIENTX_PROVISION)
		@page = Base.new.Page(ActivationBySilentProvision::ActivatingMessage)
		@page.pageExists
		step 'I wait for 30 seconds'
	rescue => e	
		STDOUT.puts e.message
		start_test_server_in_background
	end
	@page = Base.new.Page(TravelPreference)
	step 'I launch OM'
	@page.pageExists
	step 'I tap lets start on travel preference view'
end

Then(/^I try provisioning the client again when the provisioning is in process$/) do
	ActivationBySilentProvision.ActivateClientByHTML(ActivationBySilentProvision::CLIENTX_PROVISION)
	sleep 7
	ActivationBySilentProvision.ActivateClientByHTML(ActivationBySilentProvision::CLIENTX_PROVISION)
	@page = Base.new.Page(ActivationBySilentProvision::ActivationConfigurationMessage)
	@page.pageExists
end

Then(/^I assert all elements on the configuration message$/) do
	_Title = ActivationBySilentProvision::ActivationConfigurationMessage::TITLE; _Message = ActivationBySilentProvision::ActivationConfigurationMessage::MESSAGE;
	_OK = ActivationBySilentProvision::ActivationConfigurationMessage::OK
	h = {_Title => @page.lblTitle.getText, _Message => @page.lblMessage.getText, _OK => @page.btnOK.getText}
	Calx.new.AssertTextAll(h)
end

Then(/^I provision an already activated client and verify$/) do
	begin
		ActivationBySilentProvision.ActivateClientByHTML(ActivationBySilentProvision::CLIENTX_PROVISION_SILENT)
		step 'I wait for 30 seconds'
	rescue => e
		STDOUT.puts e.message
		start_test_server_in_background
	end
	step 'I assert all elements on dashboard page'
end

Then(/^I initiate provisioning of a client to see internet error$/) do
	begin
		ActivationBySilentProvision.ActivateClientByHTML(ActivationBySilentProvision::CLIENTX_PROVISION)
	rescue => e	
		start_test_server_in_background
	end
	@page = Base.new.Page(ActivationCode::NoInternetError)
	@page.pageExists()
end

Then(/^I try to provision a client using an (valid|invalid) profile id with a (valid|invalid) pin and verify the error$/) do |profile, pin|
	puts "profile --> #{profile}"
	if profile === "valid"
		const = ActivationBySilentProvision::CLIENTX_PROVISION_INVALID_PIN
	else
		const = ActivationBySilentProvision::CLIENTX_PROVISION_INVALID_PROFILE
	end
	begin
		ActivationBySilentProvision.ActivateClientByHTML(const)
		step 'I wait for 20 seconds'
	rescue => e
		log(e.message)
		start_test_server_in_background
	end
	@page = Base.new.Page(ActivationBySilentProvision::InvalidProfileMessage)
	@page.pageExists
end

Then(/^I try to provision a client using a miscongfigured schema url$/) do
	begin
		ActivationBySilentProvision.ActivateClientByHTML(ActivationBySilentProvision::CLIENTX_PROVISION__MISCONFIG)
		step 'I wait for 20 seconds'
	rescue => e
		log(e.message)
		start_test_server_in_background
	end
	@page = Base.new.Page(ActivationBySilentProvision::InvalidProfileMessage)
	@page.pageExists
end

Then(/I tap ok on the activation link error/) do
	@page.btnOK.tap
	sleep 3
end

Then(/^I initiate silent provisioning of client$/) do
	begin
		ActivationBySilentProvision.ActivateClientByHTML(ActivationBySilentProvision::CLIENTX_PROVISION_SILENT)
		step 'I wait for 30 seconds'
	rescue => e
		log(e.message)
		start_test_server_in_background
	end
end

Then(/^I assert all elements on the invalid activation link error$/) do
	_Title = ActivationBySilentProvision::InvalidProfileMessage::TITLE; _Message = ActivationBySilentProvision::InvalidProfileMessage::MESSAGE;
	_OK = ActivationBySilentProvision::InvalidProfileMessage::OK;
	h = {_Title => @page.lblTitle.getText, _Message => @page.lblMessage.getText, _OK => @page.btnOK.getText}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on the no internet connection notification shown while silent provisioning a client$/) do
	res = ActivationBySilentProvisionDefns.GetClientNotifications
	_Title = ActivationBySilentProvision::Notification_NoInternetMessage::TITLE; _Message = ActivationBySilentProvision::Notification_NoInternetMessage::MESSAGE;

	h = {_Title => res["title"], _Message => res["message"]}
	Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on the successful activation notification$/) do
	res = ActivationBySilentProvisionDefns.GetClientNotifications
	_Title = ActivationBySilentProvision::Notification_ActivationCompletedMessage::TITLE; _Message = ActivationBySilentProvision::Notification_ActivationCompletedMessage::MESSAGE;

	h = {_Title => res["title"], _Message => res["message"]}
	Calx.new.AssertTextAll(h)
end

