require 'calabash-android/operations'
require 'calabash-android/calabash_steps'

class Calx
	@@tcFail = false; @@arrErrors = []

	def initialize
		@@logger = OMLogger.getLogger(Calx.name)
	end

	def self.tcFail
		return @@tcFail
	end

	def self.arrErrors
		return @@arrErrors
	end

	if ENV['PLATFORM'] == 'android'
		puts "Found android platform - loading calabash-android modules"
		include Calabash::Android::Operations
	elsif ENV['PLATFORM'] == 'ios'
		puts "Found ios platform - loading calabash-ios modules"
		include Calabash::Cucumber::Operations
	elsif ENV['PLATFORM'] == 'wfm'
		puts "Found WFM platform - loading calabash-android modules"
		include Calabash::Android::Operations
	else
		raise "Unable to load platform specific calabash modules"
	end

	def ExecuteQuery(str, type=nil)
		tries = 5; count = 0
		queryResult = Hash.new

		queryString = str
		begin
			queryResult = query("#{queryString}")
			#@@logger.info("queryResult --> #{queryResult}\n")
			
			if queryResult.nil?
				@@logger.fatal("query returned nil")
				raise "query returned nil"
			end
		rescue => e
			count += 1
			@@logger.info("Exception when querying element - #{e.message}")
			sleep(2)
			if count < tries
				retry
			else
				@@logger.fatal("Couldn't find element - #{str}")
				raise "Couldn't find element - #{str}"
			end
		end	
		

		if type.nil?
			res = queryResult
		else
			res = queryResult[0]["#{type}"]
		end

		return res
	end


	def GetText(str)
		return ExecuteQuery(str, "text")
	end

	def IsEnabled(str)
		found = false
		result = ExecuteQuery(str, "enabled")
				
		if result
			found = true
		elsif result.nil?
			@@logger.fatal("Query returned null for the locator -- #{str}")
		end
		return found
	end

	def Tap(str)
		element = ExecuteQuery(str)
		if !element.empty?
			touch(element)
			@@logger.info("Tapped - #{element}")
		else
			@@logger.fatal("Query returned null for the locator -- #{str}")
		end
	end

	def SetText(str, field)
		
		if !Support.new.IsPlatformOMI()
			#Creating dummy calx object
			Calx.new
			query("#{field}", setText:"")
			query("#{field}", setText:"#{str}")
			@@logger.info("Entered text - #{str} into field - #{field}")
		else
			set_text("#{field}", "")
			set_text("#{field}", "#{str}")
			@@logger.info("Entered text - #{str} into field - #{field}")
		end
	end

	def IsCheckBoxEnabled(str)
		found = false
		result = ExecuteQuery(str, "checked")
		
		if result
			found = true
		elsif result.nil?
			@@logger.fatal("Query returned null for the locator -- #{str}")
		end
		return found
	end

	def IsElementPresent(str)
		found = element_exists(str)
		return found
	end


	def WaitForElement(str)
		arr = [str]
		begin
			wait_for_elements_exist(arr, :timeout => 60, :timeout_message => "Element not found - #{arr}")
		rescue => e
			@@logger.fatal(e.message)
		end
	end

	def WaitShort(str)
		arr = [str]
		begin
			wait_for_elements_exist(arr, :timeout => 30, :timeout_message => "Element not found - #{arr}")
		rescue => e
			@@logger.fatal(e.message)
		end
	end

	def Scroll(direction)
		performAction("scroll_#{direction}")
	end

=begin
	def WaitForElement(str, maxTimeout = nil)
		count = 0;
		if maxTimeout.nil?
			maxTimeout = 60
		end
		while count > maxTimeout
			if !IsElementPresent(str)
				sleep 1
				count += 1 
			end
			@@logger.fatal("Element not found - #{str}") if count == maxTimeout
		end
		sleep 2
	end

	def WaitShort(str)
		WaitForElement(str, maxTimeout = 30)
	end
=end

	def AssertText(hashData, test) #TXT_ACCEPT
		str, res = nil;

		hashData.each_pair do |key, value|
			res = key
			str = value
		end
		transObj = Translate.new
		#puts "strFrmDevice --> #{str}"
		@@logger.info("String from device --> #{str}")
		localizedText = transObj.OM_Translate(res)

		#Creating a dummy object just to set the class name
		calxObj = Calx.new

		if test
			if str == localizedText
				#puts "Found text on the UI"
				#puts "================================================="
				@@logger.info("Found text on the UI")
				@@logger.info("=================================================")
			else		
				@@logger.error("Failed to find - #{localizedText} on the view")
				
				@@tcFail = true
				@@arrErrors.push("Failed to find - #{localizedText} on the view")
			end
		else
			if str != localizedText
				@@logger.error("Couldn't find text - '#{localizedText}' on the view")
				
				@@tcFail = true
				@@arrErrors.push("Couldn't find text - '#{localizedText}' on the view")
				@@logger.error("=================================================")
			else
				@@logger.info("Found - #{localizedText} on the view")
			end
		end

		if @@arrErrors.length > 3
			@@tcFail = false
			@@logger.fatal("More than 3 errors occured in a scenario, exiting scenario - #{@@arrErrors}")
		end
	end

	def AssertTextAll(hashData)
		hashData.each_pair do |key, value|
			element = {key => value}
			AssertText(element, true)
		end
	end

	def GetTextFromElements(arr)
		resArray = []
		arr.each_with_index do |ele, index|
			resArray.push(arr[index]["text"])
		end
		return resArray
	end

	def self.ResetErrorRecords
		@@tcFail = false
		@@arrErrors = []
	end

	def embed(*args) #Dummy
 		@@logger.info("Embed is a Cucumber method and is not available in this console.")
 	end

end # class ends