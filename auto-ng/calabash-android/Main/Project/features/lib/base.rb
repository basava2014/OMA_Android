require_relative './calx.rb'
require_relative './logger.rb'
require 'calabash-android/operations'

class Base

	def initialize
		@@logger = OMLogger.getLogger(Base.name)
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
		@@logger.error("Unable to load platform specific calabash modules")
	end

	def Page(view)
		@@logger.info("Got class - #{view}, getting instance")
		obj = ""
		res = ObjectSpace.each_object(view) {|x| puts x; obj = x}
		#Create an instance, only if it doesn't exist

		if res.zero?
			@@logger.info("Creating page instance for class - #{view}")
			clz = view.new
			@@logger.info("--------------------")
			@@logger.info("Page instance --> #{clz}")
			@@logger.info("--------------------")
			return clz
		else
			@@logger.info("#{obj} - returning an existing instance")
			return obj
		end
	end

	def Transition(options={})
		query = options[:tap]
		#action = options[:action]
		page_class = options[:page]

    	@@logger.info("query value from hash --> #{query}")
    	@@logger.info("page class from hash --> #{page_class}")

		if page_class && query.nil?
	      @@logger.error("Called transition without providing a gesture (:tap or :action) #{transition_options}")
    	end

    	Calx.new.Tap(query)
    	sleep 2
    	page_obj = Page(page_class)
    	
    	if !page_obj.IsDisplayed()
    		@@logger.info("Element not found on page - #{page_obj} - waiting for element")
    	end

    	page_obj.Await()
		
		@@logger.info("Updated screen value to -- #{$screen}")
		return page_obj
	end

	def embed(*args) #Dummy
 		@@logger.info("Embed is a Cucumber method and is not available in this console.")
	end

end
