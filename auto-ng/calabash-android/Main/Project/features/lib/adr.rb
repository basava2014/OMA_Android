#require 'calabash-android/calabash_steps'
require 'logger'
require 'parseconfig'
require "net/http"
require "uri"

#############################
#ADR functions#
#############################

class Adr
	attr_reader :platform, :project, :build, :testLanguage, :device

	def initialize
		@@logger = OMLogger.getLogger(Adr.name)
	end

	def ReadAdrData(section,param)
		arr = []
		list = []
		machineName = `hostname`.strip
		@@logger.info("machineName --> #{machineName}")
		#machineName = "mvm-ubu12hs"

		arr = Dir['/mnt/ngc-adrdata/adr/prod/Platforms/Handheld/*.running']
		
		for str in arr do
			if str.include?machineName
				index = arr.index(str)
				break
			end
		end

		#	 ----------------commented to test

		if index.nil?
			raise "found index to be nil - Cannot assign AdrFileName to a variable"
		end
		omaAdrFile = arr[index]
		#omaAdrFile = "C:\\Users\\mhadimani\\Desktop\\ReportsData\\OMI\\3-3-0\\mvm-ubu12hs_OMA_2-10-0-311_mvm-ubu12hs_2-10-0-311_adr_032514215946.running"
		@@logger.info("AdrFile --> #{omaAdrFile}")
		

		###########################################
		#Read INI File#
		###########################################
		
		config = ParseConfig.new(omaAdrFile)
		begin
			adrData = config[section][param]
			#puts config.params #- prints a section from the INI
		rescue
			@@logger.fatal("Could not find '#{section}' in the ADR file")
		end

		if adrData.nil?
			@@logger.fatal("Could not find '#{param}' in the ADR file")
		end

		@@logger.debug("adrData --> #{adrData}")
		return adrData
	end	

	def GetProduct()
		product = ReadAdrData("TestSetup", "Product").strip
		return product
	end

	def GetBuildNo()
		build = ReadAdrData("TestSetup", "BuildNumber").strip
		return build
	end

	def GetRelease()
		release = ReadAdrData("TestSetup", "Project").strip
		return release
	end

	def GetLanguage()
		release = ReadAdrData("TestSetup", "TestLanguage").strip
		return release
	end

	def GetDevice()
		release = ReadAdrData("TestSetup", "Device").strip
		return release
	end

	def SetAdrData()
		adrObj = Adr.new

		#@platform = adrObj.GetProduct()
		#@project = adrObj.GetRelease()
		#@build = adrObj.GetBuildNo()
		#@testLanguage = adrObj.GetLanguage()
		#@device = adrObj.GetDevice()

		@platform = "OMA"
		@project = "2-10-0"
		@build = "234"
		@testLanguage = "English (en-US)"
		@device = "Samsung_Nexus_s"
	end

end


#obj = Adr.new
#obj.ReadAdrData("TestSetup","Product")

