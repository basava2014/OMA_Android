require 'calabash-android/operations'


# Base Element
class BaseElement

	attr_accessor :ele
	attr_accessor :calx, :webview

	def initialize(element)
		@ele = element;
		@calx = Calx.new;
		@webview = WebView.new

		@@logger = OMLogger.getLogger(BaseElement.name)
	end

	def tap	
		calx.Tap(ele)
	end

	def getText
		calx.GetText(ele)
	end

	def waitTillAppears
		calx.WaitForElement(ele)
	end

	def isEnabled
		calx.IsEnabled(ele)
	end

	def getElement
		calx.ExecuteQuery(ele)
	end

	def waitShort
		calx.WaitShort(ele)
	end

	def isElementPresent
		calx.IsElementPresent(ele)
	end

end

# Button
class CalButton < BaseElement

	def initialize(element)
		super(element);
		@@logger = OMLogger.getLogger(CalButton.name)
	end

end

#Switch
class CalSwitch < BaseElement

	def initialize(element)
		super(element);
		@@logger = OMLogger.getLogger(CalSwitch.name)
	end

end

#Menu
class CalMenu < BaseElement

	def initialize(element)
		super(element);
		@@logger = OMLogger.getLogger(CalMenu.name)
	end

end

#Checkbox
class CalCheckbox < BaseElement

	def initialize(element)
		super(element);
		@@logger = OMLogger.getLogger(CalCheckbox.name)
	end

	def isChecked()
		calx.IsCheckBoxEnabled(ele)
	end

end

#Label
class CalLabel < BaseElement

	def initialize(element)
		super(element);
		@@logger = OMLogger.getLogger(CalLabel.name)
	end

end

#Text Field
class CalText < BaseElement

	def initialize(element)
		super(element);
		@@logger = OMLogger.getLogger(CalText.name)
	end

	def set(text)
		calx.SetText(text, ele)
	end
end


class CalWebView < BaseElement

	def initialize(element)
		super(element)
		
		@@logger = OMLogger.getLogger(CalWebView.name)
	end

	def getTextContent
		webview.GetTextContent(ele)
	end

	def getValue
		webview.GetValue(ele)
	end

	def getPlaceholder
		webview.GetPlaceholder(ele)
	end

	def tap
		webview.Tap(ele)
	end

	def isVisible
		webview.IsVisible(ele)
	end

	def waitForPageToLoad
		webview.WaitForPageToLoad(ele)
	end

	def set(text)
		webview.SetText(text, ele)
	end
end







