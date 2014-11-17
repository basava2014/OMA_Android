
class WebView
	include Calabash::Android::Operations

	def initialize
		@@logger = OMLogger.getLogger(WebView.name)
	end

	def ExecuteWebViewQuery(str, type=nil)
		if !type.nil?
			res = performAction('execute_javascript', "#{str}.#{type}")
		else
			res = performAction('execute_javascript', "#{str}")
		end
		puts "performAction('execute_javascript',\"#{str}.#{type}\")"
		@@logger.debug(res)

		return res
	end

	def GetTextContent(str)
		res = ExecuteWebViewQuery(str, "textContent")
		@@logger.debug(res)
		
		text = res["bonusInformation"][0].strip
		return text
	end

	def GetValue(str)
		res = ExecuteWebViewQuery(str, "value")
		@@logger.debug(res)
		
		text = res["bonusInformation"][0].strip
		return text
	end

	def GetPlaceholder(str)
		res = ExecuteWebViewQuery(str, "placeholder")
		@@logger.debug(res)
		
		text = res["bonusInformation"][0].strip
		return text
	end

	def Tap(str)
		if str.include?"[id='account']"
			str = "webview css:'*[id=account] *[type=submit]'"  ##Account label locator, fix for remember password issue
			touch(str)
		else
			ExecuteWebViewQuery(str, "click()")	
		end
		@@logger.debug("Tapped - #{str}")
	end

	def GetRectLeft(str)
		res = ExecuteWebViewQuery(str, "getBoundingClientRect().left")
		@@logger.debug(res)
	
		left = res["bonusInformation"][0].to_i
		return left
	end

	def GetRectRight(str)
		res = ExecuteWebViewQuery(str, "getBoundingClientRect().right")
		@@logger.debug(res)
		
		right = res["bonusInformation"][0].to_i
		return right
	end

	def SetText(str, field)
		performAction('execute_javascript',"#{field}.value='#{str}'")
		puts "Set successful, value = #{str}, field = #{field}"
	end


	def IsVisible(str)

		bFound = false
		puts "Entered - IsVisible"
		
		left = GetRectLeft(str)
		@@logger.debug("Client rect left --> #{left}")

		right = GetRectRight(str)
		@@logger.debug("Client rect right --> #{right}")

		#if !left.nil? && !right.nil?
		if left>1.0 && right>1.0
			bFound = true	
		end
		#else
		#	raise "Get query returned nil for" 
		#end
		return bFound
	end

	def WaitForPageToLoad(str)
		data = Hash.new
		maxCount = 25; count = 0
		
		begin
			puts "Entered Begin"		
			data = ExecuteWebViewQuery(str)["bonusInformation"][0]
			
			puts "WaitForPageToLoad --> #{data}"
			if data != "null"
				bFound = IsVisible(str)
				puts "Is the element visible #{bFound}"
				
				if bFound
					puts "Result Found"
				else
					raise "Found Webview query to be empty"	
				end
			else
				raise "Found Webview query to be empty"
			end
		rescue => e
			puts "Exception Details --> #{e}"
			count = count+1
			sleep 1

			retry if count < maxCount
		end
		if count == maxCount
			raise "Could not find webview"
		end
		
		puts "Took #{count} seconds to load the page"
		sleep 2
	end

end