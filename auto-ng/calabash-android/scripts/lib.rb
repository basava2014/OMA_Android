require 'rubygems'
#require '/opt/auto-ng/calabash-android/Main/Project/features/step_definitions/common_steps.rb'
require 'parseconfig'
require 'sqlite3'
require 'json'



class ReportsLib

	#@@reportDataFile = "C:\\Users\\mhadimani\\Desktop\\ReportsData\\ReportData.txt"
	@@reportDataFile = "/opt/auto-ng/calabash-android/Main/Project/ReportData.txt"


	def ParseJsonData(jsonFile) 
		result = File.read(jsonFile)
		jsonData = JSON.parse(result)
		#puts jsonData
	end


	def GetADRExecData ()
		
		adrData = []
		resultHash = Hash.new
		file = ReportsLib.class_variable_get(:@@reportDataFile)
		
		if !File.exists?(file)
			raise "File not found -#{reportDataFile}"
		end


		contents = File.readlines(file)
		for element in contents
			data = element.split("=")[1].strip()
			adrData.push(data)
		end

		resultHash = {:adrFileName => adrData[0], :project => adrData[1], :build => adrData[2], :testLang => adrData[3], :device => adrData[4]}	
		return resultHash
	end


	def MergeHashData(array1, array2) # Needs fix
		timePerFeature = nil
		array2.each_with_index do |e2,i|
			name2 = array2[i][:feature]
			#puts "name2 --> #{name2}"
			timePerFeature = array2[i][:duration]
			#puts "e2 --> #{e2}" 

			array1.each_with_index do |e1,j|
				name1 = array1[j][:feature]
				#puts "name1 --> #{name1}"

				if name1 == name2
					#puts "e3 --> #{e2}"
					e1.merge!(e2)
				end
				
			end
		end
		#puts array1
		return array1
	end


	def MergeReportData(array1, hash1)
		arr= []
		h = Hash.new

		array1.each_with_index do |element, i|
				h = hash1.merge(element)
				arr.push(h)
			end

		return arr
	end


	def ConvertToMins(timeInNanoSec)
		timeInMins = timeInNanoSec.to_f / 60000000000
		timeInMins = timeInMins.round(2)
	    #puts "Total time taken in mins -->  #{timeInMins}"
	    return timeInMins
	end


end # class ends


#id VARCHAR(255) PRIMARY KEY
class DBHelper

	#@@reportDir = "C:\\Users\\mhadimani\\Desktop\\ReportsData" # Android
	#@@reportDir = "C:\\Users\\mhadimani\\Desktop\\ReportsData\\OMI" # IOS
	@@reportDir = "/mnt/ngc-adrdata/adr/prod/Platforms/Handheld/OMA"
	@@releaseDBFile = nil
	@@dbResultTable = "CREATE TABLE report(
					adrfilename VARCHAR(255),
					project VARCHAR(255),
					build VARCHAR(20),
					language VARCHAR(20),
					device VARCHAR(30),
					feature VARCHAR(20),
					pass VARCHAR(10),
					fail VARCHAR(10),
					total VARCHAR(10),
					duration VARCHAR(10)
						)"
	@@dbScenarioTable = "CREATE TABLE scenario(
					adrfilename VARCHAR(255),
					scenario VARCHAR(255),
					tcID VARCHAR(50),
					error VARCHAR(255)
						)"

	def CreateDB_Table(ver)
		
		#dbfile = "C:\\Users\\mhadimani\\Desktop\\ReportsData\\#{releaseVer}\\reports.db"
		dbFile = "#{DBHelper.class_variable_get(:@@reportDir)}/#{ver}/reports.db"
		dbTable = DBHelper.class_variable_get(:@@dbResultTable)
		dbScenarioTable = DBHelper.class_variable_get(:@@dbScenarioTable)
		#puts "dbFile --> #{dbFile}"

		if !File.exists?(dbFile)
			puts "Found db not found"			
		end

		db = SQLite3::Database.new( dbFile )
		
		begin  #execute SQL commands to verify if the table isn't empty

			rows = db.execute("select * from report")
  			#puts "rows --> #{rows}"
  			
  		rescue => e
 			puts "Exception Details --> #{e}"
  			db.execute (dbTable)
  			puts "Created new table"
		end
		
		begin #execute SQL commands to verify if the scenario table exists
			r2 = db.execute("select * from scenario")
  			#puts "r2 --> #{r2}"
  		rescue => e
  			puts "Exception Details (scenario)--> #{e}"
  			db.execute (dbScenarioTable)
  			puts "Created new table - scenario"
  		end

		DBHelper.class_variable_set(:@@releaseDBFile,dbFile)
	end


	def InsertRecords(record, table, platform)
		recordArray = [] 
		bindParam = ["?"]
		sqlStmt = []
		dbFile = DBHelper.class_variable_get(:@@releaseDBFile)
		#dbFile = "C:\\Users\\mhadimani\\Desktop\\ReportsData\\OMI\\3-3-0\\reports.db" 
		#puts "Record sent to InsertRecords --> #{record}"
		begin
			recordLen = record[0].values.length.to_i
		rescue => e
			puts "Exception --> #{e} -- table -- #{table}"
			recordLen = record.values.length.to_i
		end
		
		if platform === "OMI"
			if table === "report"
				recordLen = recordLen + 1
			end
		end

		#puts "recordLen --> #{recordLen}"
		params = bindParam.cycle(recordLen).to_a.join(",")
		#puts params

		db = SQLite3::Database.new( dbFile )

		#tableInfo = db.execute("PRAGMA table_info(\"report\")") # get total columns from report table
		#dbInsert = db.prepare( "INSERT INTO report VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" )
		dbInsert = db.prepare( "INSERT INTO #{table} VALUES (#{params})" )
		#puts "INSERT INTO #{table} VALUES #{params}"

		
		#puts "record class --> #{record.class}"
		#puts "record insert --> #{record}"

		for data in record
			#puts "data each_pair --> #{data}"
			data.each_pair do |key, value|
				#puts "#{key} ==> #{value}"
				recordArray.push(value)			
			end
		end

		#puts recordArray.length
		recordArray.each_with_index do |val, index|
			sqlStmt.push(val)
			#puts "#{index} == #{recordArray.length}"
			if platform === "OMI"
				if index === recordArray.length-1
					if table === "report"
						puts "reached end"
						sqlStmt.push("")	
					end
				end
			end
		end
		
		#puts sqlStmt.length
		#dbInsert.execute(recordArray[0],recordArray[1],recordArray[2],recordArray[3],recordArray[4],recordArray[5],recordArray[6],recordArray[7],recordArray[8],recordArray[9])
		dbInsert.execute (sqlStmt)

	end



end #class ends 

def ReadAdrData(section,param)
	arr = []
	list = []
	machineName = `hostname`.strip
	#puts "machineName --> #{machineName}"
	#machineName = "mvm-ubu12hs"

	arr = Dir['/mnt/ngc-adrdata/adr/prod/Platforms/Handheld/*.running']
	#arr.each {|x| list << x.scan((/_([^_]*)/))[2]}

	#puts list
	
	for str in arr do
		if str.include?machineName
			index = arr.index(str)
			break
		end
	end

	if index.nil?
		raise "found index to be nil - Cannot assign AdrFileName to a variable"
	end
	omaAdrFile = arr[index]
	puts omaAdrFile
	
	###########################################
	#Read INI File#
	###########################################
	
	config = ParseConfig.new(omaAdrFile)
	begin
		adrData = config[section][param]
		#puts config.params #- prints a section from the INI
	rescue
		raise "Could not find '#{section}' in the ADR file"
	end

	if adrData.nil?
		puts "Could not find '#{param}' in the ADR file"
	end

	puts "adrData --> #{adrData}"
	return adrData
end


def MainMethod()
	record = [{:adrFileName=>"mvm-ubu12hd1_OMA_2-10-0_mvm-ubu12hd1_2-10-0-4_adr_1218132346036", :project=>"2-10-0", :build=>"67890", :testLang=>"german", :device=>"LG Nexus-4", :feature=>"GUI", :pass=>"2", :fail=>"0", :total=>"2", :duration=>"0.84"}
]
	obj = ReportsLib.new
	#obj.ReadJsonFromZip()
	#obj.GetADRExecData()
	dbObj = DBHelper.new
	# dbObj.CreateDB_Table("2-10-0") #Android
	dbObj.CreateDB_Table("3-3-0") # IOS
	dbObj.InsertRecords(record)
end


#MainMethod() 