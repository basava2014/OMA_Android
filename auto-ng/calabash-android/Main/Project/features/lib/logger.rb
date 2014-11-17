require 'singleton'
require 'logger'

class OMLogger
	attr_accessor :clz
	include Singleton

	def initialize()
		@log = Logger.new("log.txt")
		@log.level = Logger::INFO
	end    
	
	def error(msg)
		puts "Caught Exception -- <class>#{@clz} -- <message>#{msg}"
		@log.error("\n********************************\n" +formatted_message(@clz, msg)+"\n********************************")
		#raise msg		
	end   

	def warn(msg)
		puts msg
		@log.warn(formatted_message(@clz, msg))
	end    

	def info(msg)
		puts msg
		@log.info(formatted_message(@clz, msg))
	end

	def debug(msg)
		puts msg
		@log.debug(formatted_message(@clz, msg))
	end

	def fatal(msg)
		@log.fatal("\n********************************\n" +formatted_message(@clz, msg)+"\n********************************")
		raise msg
	end

	def formatted_message(className, message)
		return "#{className} - #{message}"
	end

	def self.getLogger(className)
		instance.clz = className
		return OMLogger.instance
	end

end

#a = OMLogger.getLogger("KL")
#a.info("This is just a message")


#OMLogger.feature = "Activation"
#logger = OMLogger.instance()


#logger.info('Doing the first thing')
#logger.info('Doing the second thing')

#logger.warn("this is a warning message")

#logger.error("This is an error message")

#logger.debug("This is a debug message")

#logger.fatal("This is a fatal message")