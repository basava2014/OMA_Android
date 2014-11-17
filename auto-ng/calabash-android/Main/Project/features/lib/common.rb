require "net/http"
require "uri"
require 'calabash-android/management/adb'
require 'calabash-android/operations'
require_relative './logger.rb'


class Setup

  def Initialize
    dhObj = DataHelper.new
    dhObj.LoadYAML()
    dhObj.UpdateAppConfigYAML()

    localeObj = Locale.new
    localeObj.SetDeviceLocale()

    @@logger = OMLogger.getLogger(Setup.name)
  end

end

class Support

  def initialize
    @@logger = OMLogger.getLogger(Support.name)
  end

  def IsPlatformOMI
    isOMI = false
    platform = "OMA"
    #platform = DataHelper::OM_APPCONFIG["PLATFORM"]
    if platform === "OMI"
      isOMI = true
    end
    return isOMI
  end

  def IsAlpha(str)
    digit = /[0-9]/.match(str).nil?
    alpha = /[A-Za-z]/.match(str).nil?
    
    if !digit
      if !alpha
        found = true
      else
        found = false
      end
    else
      found = false
    end
  end

  def IsConnected
    #resultFile = "/opt/auto-ng/calabash-android/Main/Project/InternetDetectionTest.txt"
    resultFile = "C:\\Users\\mhadimani\\Desktop\\new_framework\\auto-ng\\calabash-android\\Main\\Project\\InternetDetectionTest.txt"

    #Invoke InternetDetectionTest.apk
    `adb shell am start com.internetdetectiontest/.MainActivity`
    @@logger.info("invoked InternetDetectionTest apk")
    30.times do 
      adbCopy = "adb pull /mnt/sdcard/InternetDetectionTest.txt"
      `#{adbCopy}`
      if !File.exists?(resultFile)
        sleep 1
      else
        @@logger.info("Copied file to project folder")
        break
      end  
    end
    @@logger.fatal("InternetDetectionTest file not found OR copy operation failed") if !(File.exists?(resultFile))   
    
    content = IO.read(resultFile)
    status = content.split("|")[0]
    if !(status === "false")
      @@logger.info("SNIFF test successful..")
      return true
    else
      @@logger.info("SNIFF test failed!! -- error from APK -- #{content.split("|")[1]}")
      return false
    end
  end
  
end

class Network
  attr_accessor :url

  def initialize(requestUrl)
    @url = requestUrl
    encoded_url = URI.encode(@url)
    uri = URI.parse(encoded_url)
    @http = Net::HTTP.new(uri.host, uri.port)
    
    if @url.include?"https"
      @http.use_ssl = true
    end
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    @@logger = OMLogger.getLogger(Support.name)
  end


  def SendRequest()
    request = Net::HTTP::Get.new(@url)
    @http.request(request)
  end

  def GetResponse
    response = SendRequest()
    case response.code.to_i
    when 200
      @@logger.info("Http request successful")
      #@@logger.debug("Response --> #{response.body.strip}")
    end
    return response.body.strip
  end

end

class MathRandom

  def initialize
    @@logger = OMLogger.getLogger(MathRandom.name)
  end

  def GenRandom(times)
    i = times.to_i
    o = [('a'..'z'), ('A'..'Z'), (0..9)].map { |i| i.to_a }.flatten
    str = (0...i).map { o[rand(o.length)] }.join
    #puts str
    return str
  end

  def GetRandomNumbers(times)
    i = times.to_i
    o = [(0..9)].map { |i| i.to_a }.flatten
    str = (0...i).map { o[rand(o.length)] }.join
    #puts str
    return str
  end
     
end

#sniff = "http://sniff.gslb.i-pass.com"
#uldb = "https://uldb-hs.ipass.com/v2/getnearbyhotspots?lat=12.9711065&lng=77.6147642&miles=5&limit=50&platform=AndroidPhone&api_key=ProfFalken"
#net = Network.new(uldb)
#Support.new.IsConnected()
#net.GetResponse()
