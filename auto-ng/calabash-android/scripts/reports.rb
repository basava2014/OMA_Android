require 'rubygems'
require 'json'
require '/opt/auto-ng/calabash-android/scripts/lib.rb'


class JSONDataHelper

	def GetResult(jsonObj)

		@totalCount=0, @failCount=0, @passCount=0
		array_hash = []
		resultHash = Hash.new

		for str in jsonObj
			featureName = str["name"]
			
			@totalCount = str["elements"].length
			#puts "totalCount --> #{@totalCount}"

			for elementData in str["elements"]
				steps = elementData["steps"]

				#puts "No. of steps per scenario --> #{steps.length}"
				begin
					scenarioResult = steps[steps.length-1]["result"]["status"]
				rescue
					next
				end
								
				if scenarioResult == "passed"
					@passCount=@passCount+1
				elsif scenarioResult == "failed" || scenarioResult == "skipped"
					@failCount=@failCount+1
				end

			end
		resultHash = {:feature => "#{featureName}", :pass => "#{@passCount}", :fail => "#{@failCount}", :total => "#{@totalCount}"}	
		array_hash.push(resultHash)
		
		@passCount=0; @failCount=0
		
		end


		return array_hash
	end


	def GetExecutionTime(jsonObj)
		
		totalTimeInMins = 0, totalDurationPerScenario = 0, totalDurationPerFeature = 0
		array_hash = []
		resultHash = Hash.new

		for str in jsonObj
			featureName = str["name"]
			
			for elementData in str["elements"]
				steps = elementData["steps"]
			
				for data in steps
					duration = data["result"]["duration"]
					totalDurationPerScenario = totalDurationPerScenario+duration
				end
				
				totalDurationPerFeature = totalDurationPerFeature + totalDurationPerScenario
				#puts "totalDurationPerFeature --> #{totalDurationPerFeature}"
				timeObj = ReportsLib.new
				totalTimeInMins = timeObj.ConvertToMins(totalDurationPerFeature)
				totalDurationPerScenario = 0
			end

			totalDurationPerFeature = 0
			resultHash = {:feature => "#{featureName}", :duration => "#{totalTimeInMins}"} # Commented to return only the duration
			#resultHash = {:duration => "#{totalTimeInMins}"}
			array_hash.push(resultHash)
		end

		#puts array_hash
		return array_hash
	end


	def GetErrors(jsonObj)

		array_hash = []
		resultHash = Hash.new

		for str in jsonObj
			featureName = str["name"]
			#puts featureName
			
			for elementData in str["elements"]
				
				scenario = elementData["name"]
				tcID = elementData["tags"][0]["name"]
				#puts "#{scenario} -- #{tcID}"

				steps = elementData["steps"]
			
				for data in steps
					if data["result"]["status"] == "failed"

						if !data["result"]["error_message"].nil?
							errorMsg = data["result"]["error_message"]
							
							#resultHash = {:feature => "#{featureName}", :scenario => "#{scenario}", :tcID => "#{tcID}", :errorMsg => "#{errorMsg}"}
							resultHash = {:scenario => "#{scenario}", :tcID => "#{tcID}", :errorMsg => "#{errorMsg}"}
							array_hash.push(resultHash)
						end
					end
				end			
			end
		
		end
		#puts array_hash
		return array_hash
	
	end


end  #class ends
################
#Main 
################

def getExecutionStats 
	@file = "/opt/auto-ng/calabash-android/Main/Project/cucumber.json"
	libObj = ReportsLib.new
	obj = JSONDataHelper.new

	jsonObj = libObj.ParseJsonData(@file)
	data = obj.GetResult(jsonObj)
	puts data
end


def invokeMethod
	
	dataArray = []
	adrData = Hash.new
	adrFileHash = Hash.new
	platform = ReadAdrData("TestSetup","Product")

	#@file = "C:\\Users\\mhadimani\\Desktop\\ReportsData\\2-10-0\\cucumber.json"   #Android
	#@file = "C:\\Users\\mhadimani\\Desktop\\ReportsData\\OMI\\3-3-0\\omi_cucumber.json"  #IOS
	@file = "/opt/auto-ng/calabash-android/Main/Project/cucumber.json"
	#@file = "e:\\ReportsData\\cucumber.json"

	libObj = ReportsLib.new
	jsonObj = libObj.ParseJsonData(@file)
	
	jsonDataHelperObj = JSONDataHelper.new
	execResult = jsonDataHelperObj.GetResult(jsonObj)
		
	if platform == "OMA"
		execDuration = jsonDataHelperObj.GetExecutionTime(jsonObj)
		dataArray = libObj.MergeHashData(execResult, execDuration)
	else
		dataArray = execResult #Comment for Android
	end	
	
	adrData = libObj.GetADRExecData()
	reportData = libObj.MergeReportData(dataArray, adrData)
	#puts reportData

	scenarioErrors = jsonDataHelperObj.GetErrors(jsonObj) #Get Scenario data & adrFileName
	adrFileHash = {:adrFileName => adrData[:adrFileName]} 
	
	errorData = libObj.MergeReportData(scenarioErrors, adrFileHash)# Merge Scenario data with the adrFileName
	#puts "errorData --> #{errorData}"

	dbObj = DBHelper.new
	relVer = adrData[:project]
	#(:project)
	#relVer = "3-3-0"
	dbObj.CreateDB_Table(relVer)
	puts execResult
	dbObj.InsertRecords(reportData,"report",platform)

	for data in errorData
		arrData = []
		arrData.push(data)
		#puts "data --> #{data}"
		dbObj.InsertRecords(arrData,"scenario",platform)	
	end
	
	return execResult
end

#InvokeMethod()

