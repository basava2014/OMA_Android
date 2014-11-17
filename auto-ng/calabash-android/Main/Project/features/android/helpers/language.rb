require 'logger'
require 'rubygems'
require 'roo'
require 'calabash-android/management/adb'
#require 'C:\\Users\\mhadimani\\Desktop\\new_framework\\features\\step_definitions\\datahelper.rb'


#log = Logger.new(STDOUT)
#log = Logger.new('H:\Ruby\Projects\auto-ng\calabash-android\log_file.log', 'monthly')   
class Translate

	attr_accessor :WORKBOOKOBJ

	def initialize
		@@logger = OMLogger.getLogger(Translate.name)
	end

	def ReturnExcelObject

		constInit = defined?WORKBOOKOBJ
		if constInit.nil?
			@@logger.info("Creating workbook object")
			file = File.join(File.dirname(__FILE__), '../../../Translations.xlsx')

			workbook = Roo::Excelx.new(file)
			workbook.default_sheet = workbook.sheets.first
			self.class.const_set(:WORKBOOKOBJ, workbook)
		end
		return Translate::WORKBOOKOBJ
	end

	def GetLocalizedStringFromWorkbook(str, lang)
		arrLang = []
		arrRows = []
		rows = []

		#lang =LangMapping()
		@@logger.info("str--> #{str}")
		@@logger.info("lang--> #{lang}")

		obj = ReturnExcelObject()
		
		#Get column for excel - #####################################
		1.upto(obj.last_column) do |col|
			arrLang << obj.cell(1,col)
		end
		
		englishLangIndex = arrLang.index {|x| x.match(/Final|English(.*)/) }
		
		#puts arrLang.index {|i| i.downcase == lang.downcase}
		columnIndex = arrLang.index {|i| i.downcase == lang.downcase}
		columnIndex = columnIndex+1
		
		#Get row from excel	- #######################################	
		 
		englishLangIndex = englishLangIndex+1
		
		1.upto(obj.last_row) do |line|
			rows << obj.cell(line,englishLangIndex)
		end
		#puts "arrRows -->#{arrRows}"
		arrRows = rows.collect{|x| "#{x}".strip} # Added to trim whitespace in the array elements
		
		rowIndex = arrRows.index { |r| r == str}
		rowIndex = rowIndex.to_i+1
		@@logger.info("rowIndex --> #{rowIndex}")
		
		# Get string for a language using the rowIndex,columnIndex - ####################################
		bFound = false

		if arrRows.include?(str)
			puts "Localized string found - '#{str}'' in the excel"
			bFound = true
			localizedString = obj.cell(rowIndex,columnIndex)
			#puts "Before trim"
			#puts "#{localizedString} == #{str}"
			#localizedString = localizedString.strip
		end
			
		if bFound == false
			@@logger.fatal("Localized string - '#{str}' not found in excel")
		end	
		
		return localizedString
	end

	#str = GetLocalizedStringFromWorkbook("Accept","German")
	#puts str

	#####################################################
	# Gets the language from language ISO code

	def LangMapping(slocale)
		locales = { 
			"en" => "English",
			"de" => "German",
			"es" => "Spanish",
			"fr" => "French",
			"it" => "Italian",
			"ja" => "Japanese",
			"ko" => "Korean",
			"nl" => "Dutch",
			"th" => "Thai",
			"zh" => "Simplified Chinese",
			#{}"zh" => "traditionalchinese",
			"ru" => "Russian",
			"pt" => "Portuguese"
		}
		
		if slocale == "zh"
			countryCode = `adb shell getprop persist.sys.country`
			countryCode = countryCode.delete "\r\n"
			if countryCode == "TW"
				deviceLang = "Traditional Chinese"
			else
				deviceLang = locales.fetch(slocale)	
			end
		else 
			deviceLang =locales.fetch(slocale)	
		end
		#@@logger.info("GotLanguage from LangMapping() -#{deviceLang}")
		return deviceLang
	end

	############################################################

	#Translates string

	def OM_Translate(str)

		puts "Executing OM Translate"
		#puts "str in OM_Translate --> #{str}"
		if !str.empty?
			
			#sLocale = GetDeviceLocale() - Commented to test global
			#puts "Locale=#{sLocale}" - Commented to test global
			#deviceLanguage = LangMapping(sLocale) - Commented to test global
			
			#GetLocalizedStringFromWorkbook("Good",value)
			#deviceLanguage = $sTestLang

			#deviceLanguage = "German"
			deviceLanguage = Locale.new.GetLanguageFromISOCode()

			if deviceLanguage.downcase == "English".downcase	
				# fix for parentheses issue
				if str.include?")"
					str = str.gsub(/\(/,"\(").gsub(/\)/,"\)")
				elsif str.include?"]"
					str = str.gsub(/\[/,"\[").gsub(/\]/,"\]")	
				end
				#@@logger.info("Got device language as - 'English'")
				#performAction('wait_for_text',str)
				#performAction('assert_text', str, true)
				localizedStr = str
			else
				@@logger.info("Got device language as - '#{deviceLanguage}', performing translations")
				localizedStr = GetLocalizedStringFromWorkbook(str,deviceLanguage)
				if localizedStr.nil?
					@@logger.fatal("localizedStr is empty - Could not find the string - '#{localizedStr}' in the excel")
				else 
					# fix for parentheses issue
					if localizedStr.include?")"
						#localizedStr = localizedStr.gsub(/\(/,"\\\\(").gsub(/\)/,"\\\\)")
						localizedStr = localizedStr.gsub(/\(/,"\(").gsub(/\)/,"\)")
					elsif localizedStr.include?"]"
						localizedStr = localizedStr.gsub(/\[/,"\[").gsub(/\]/,"\]")	
					end
					#performAction('wait_for_text',localizedStr)
					#performAction('assert_text',localizedStr, true)
				end
			end
		end
		@@logger.info("localizedStr --> #{localizedStr}")
		return localizedStr
	end

end #Class Ends


class Locale

	def initialize
		@@logger = OMLogger.getLogger(Locale.name)
	end

	def GetDeviceLocale()      # Gets the device language code using ADB
		cmd = "adb shell getprop persist.sys.language"
		result = `#{cmd}`
		result = result.delete "\r\n"
		return result
	end

	def SetDeviceLocale()

		langToSet = DataHelper::OM_APPCONFIG["TESTLANGUAGE"]
		#langToSet = "German (de-DE)"

		arr = langToSet.scan(/\([^\)]*/)[0].delete('(').split("-")
		
		langISOCode = arr[0]
		@@logger.info("Language ISO Code from OM_APPCONFIG--> #{langISOCode}")
		countryISOCode = arr[1]
		@@logger.info("Country ISO Code from OM_APPCONFIG --> #{countryISOCode}")
		
		@@logger.info("Restarting ADB as root")
		
		su = system("adb root")
		if !su
			@@logger.fatal("Fatal error - Couldn't find device")
			raise "Fatal error - Couldn't find device"
			abort
		else
			sleep(7)
		end	

		currentLangSet = GetDeviceLocale()
		if currentLangSet === "en"
			@@logger.info("found default language - English")
		else
			langcmd = "adb shell setprop persist.sys.language #{langISOCode}"
			countrycmd = "adb shell setprop persist.sys.country #{countryISOCode}"	
			@@logger.info("Setting device language")

			`#{langcmd}`
			`#{countrycmd}`
			#`adb reboot`
			`adb shell stop`
			`adb shell start`
			sleep 30
		end

		langSetOnDevice = GetDeviceLocale()
		if langSetOnDevice == langISOCode
			#lang = Translate.new.LangMapping(langSetOnDevice) #Commented to refer to a ADR langauge
			#self.class.const_set(:DEVICELANGUAGE, lang)
			puts "Langauge Successfully set"
		else
			raise "Language not set to TestLanguage - Abort"
		end
	end


	def GetLanguageFromISOCode
		arr = []
		adrTestLang = DataHelper::OM_APPCONFIG["TESTLANGUAGE"]

		arr = adrTestLang.scan(/\([^\)]*/)[0].delete('(').split("-")
		langISOCode = arr[0]
		trueLang = Translate.new.LangMapping(langISOCode)
		@@logger.info("Language from ADR --> #{trueLang}")
		return trueLang
	end


end

#sLocale = GetDeviceLocale()
#puts "Locale=#{sLocale}"
#value = LangMapping(sLocale)
#puts "value = #{value}"
#GetLocalizedStringFromWorkbook("Activation Code","thai")
#kl = Locale.new
#l.SetDeviceLocale()

#puts "langauge --> #{Locale::DEVICELANGUAGE}"