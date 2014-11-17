require 'yaml'
#require 'C:\\Users\\mhadimani\\Desktop\\new_framework\\features\\step_definitions\\adr.rb'

class DataHelper

	attr_reader :OM_LABELS, :OM_LOCATORS, :OM_APPCONFIG
	
	OM_CONFIG = File.join(File.dirname(__FILE__), '../res/appConfig.yml')

	#OMA_LABELS = "../res/oma_labels.yml"
	#OMA_LOCATORS = "../res/oma_locators.yml"
	#OMA_LABELS = "C:\\Users\\mhadimani\\Desktop\\new_framework\\features\\res\\oma_labels.yml"
	#OMA_LOCATORS = "C:\\Users\\mhadimani\\Desktop\\new_framework\\features\\res\\oma_locators.yml"
	
	#OMI_LABELS = "../res/omi_labels.yml"
	#OMI_LOCATORS = "../res/omi_locators.yml"
	
	#WFM_LABELS = "../res/wfm_labels.yml"
	#WFM_LOCATORS = "../res/wfm_locators.yml"

	def initialize
		@@logger = OMLogger.getLogger(DataHelper.name)
	end

	def UpdateAppConfigYAML()
		puts "LOADING UPDATEAPPCONFIGYAML"
		obj = Adr.new
		obj.SetAdrData()
		begin
			appConfigFile = YAML.load_file("#{DataHelper::OM_CONFIG}") #Load
			appConfigFile["PLATFORM"] = obj.platform
			appConfigFile["PROJECT"] = obj.project
			appConfigFile["BUILD"] = obj.build
			appConfigFile["TESTLANGUAGE"] = obj.testLanguage
			appConfigFile["DEVICE"] = obj.device

			File.open("#{DataHelper::OM_CONFIG}", 'w') {|f| f.write appConfigFile.to_yaml }
		rescue => e
			@@logger.fatal("Could not parse YAML: #{e.message}")
			raise "Could not parse YAML: #{e.message}"
		end
	end
	
	def LoadYAML()

		# platform = "OMA"

		#adrObject = Adr.new                   - Uncomment this
		#platform = adrObject.platform			- Uncomment this
		
		# begin
			# case platform
			# when "OMA"
				# om_str = YAML.load_file("#{DataHelper::OMA_LABELS}")
				# om_loc = YAML.load_file("#{DataHelper::OMA_LOCATORS}")
				#puts om_str.inspect
				#puts om_loc.inspect
			# when "OMI"
				# om_str = YAML.load_file("#{DataHelper::OMI_LABELS}")
				# om_loc = YAML.load_file("#{DataHelper::OMI_LOCATORS}")
				#puts om_str.inspect
				#puts om_loc.inspect
			# when "WFM"
				# om_str = YAML.load_file("#{DataHelper::WFM_STRINGS}")
				# om_loc = YAML.load_file("#{DataHelper::WFM_LOCATORS}")
				#puts om_str.inspect
				#puts om_loc.inspect
			# else
				# raise "Could not find matching "
			# end
		# rescue => e
			# raise "Could not parse YAML: #{e.message}"
		# end

		begin
			om_appConfig = YAML.load_file("#{DataHelper::OM_CONFIG}")
			#puts om_appConfig.inspect
		rescue => e
			@@logger.fatal("Could not parse appConfig YAML: #{e.message}")
			raise "Could not parse appConfig YAML: #{e.message}"
		end

		self.class.const_set(:OM_APPCONFIG, om_appConfig)
		# self.class.const_set(:OM_LABELS, om_str)
		# self.class.const_set(:OM_LOCATORS, om_loc)	
	end 

	def getTextFromYAML(str)
		data = DataHelper::OM_LABELS

		if data.has_key?str
			#puts "Found key in data hash"
			result = data["#{str}"]
		else
			raise "Could not find hash key #{str} in #{__method__}"
		end
		
		#puts "Text --> #{result}"
		return result
	end

	def getQueryStringFromYAML(str)
		
		data = DataHelper::OM_LOCATORS
		str =  str.gsub(/TXT_|LBL_/,"LOC_")
	
		if data.has_key?str
			#puts "Found key in data hash"
			result = data["#{str}"]
		else
			raise "Could not find hash key #{str} in #{__method__}"
		end
		
		#puts "querystring --> #{result}"
		return result
	end

end

#a = DataHelper.new
#a.getTextFromYAML("TXT_ABOUT")
#a.getQueryStringFromYAML("BTN_SETTINGS")
#a.UpdateAppConfigYAML()
#a.LoadYAML()
#puts DataHelper::OM_LABELS
#puts DataHelper::OM_LOCATORS
#puts DataHelper::OM_APPCONFIG
