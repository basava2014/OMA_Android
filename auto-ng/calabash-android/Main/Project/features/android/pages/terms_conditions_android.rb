
##Classes
class Terms
	attr_accessor :btnAccept

	ACCEPT = "Accept"

	def initialize
		@btnAccept = CalButton.new("* id:'button1'")

		@@logger = OMLogger.getLogger(Terms.name)
	end

	def pageExists
		Terms.new.btnAccept.waitTillAppears()
	end

end

##Steps
Then(/^I assert and tap accept$/) do
	@page = Base.new.Page(Terms)
	@page.pageExists
	_Accept = Terms::ACCEPT
	h = {_Accept => @page.btnAccept.getText()}
	Calx.new.AssertTextAll(h)

	@page.btnAccept.tap()
	puts "***Tapped Accept button***"
	@page = Base.new.Page(Welcome)
	@page.pageExists()
end

