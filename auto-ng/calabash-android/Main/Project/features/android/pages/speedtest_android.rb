#####Classes#####

class SpeedTest

	class SpeedTestStart
	 attr_accessor :lblTitle, :lblMessage, :btnCancel, :btnStart

	 TITLE = "Speed Test"
	 MESSSAGE = "Check if your Internet speed measures up! This may take a few minutes to complete."
	 CANCEL = "Cancel"
	 START = "Start"

	    def initialize

		     @lblTitle = CalLabel.new("* id:'alertTitle'")
		     @lblMessage = CalLabel.new("* id:'message'")
		     @btnCancel = CalButton.new("* id:'button2'")
		     @btnStart = CalButton.new("* id:'button1'")

		     @@logger = OMLogger.getLogger(SpeedTestStart.name)
	    end
	
	    def pageExists
		      SpeedTestStart.new.lblTitle.waitTillAppears()
	    end	
	end
	
	class SpeedTestWithNoConnection
       attr_accessor :lblTitle, :lblMessage, :btnCancel

         TITLE = "Speed Test"
         MESSAGE = "You must be connected to start the speed test."
         CANCEL = "Cancel"

         def initialize
         	@lblTitle = CalLabel.new("* id:'alertTitle'")
         	@lblMessage = CalLabel.new("* id:'message'")
         	@btnCancel = CalButton.new("* id:'button2'")

         	@@logger = OMLogger.getLogger(SpeedTestWithNoConnection.name)
         end

         def pageExists
               SpeedTestWithNoConnection.new.lblTitle.waitTillAppears()
         end	
    end

    class SpeedTestResults
  	    attr_accessor :btnSpeedTest, :lblTitle, :lblGood, :lblQuality, :lblLatency, :lblPacketLoss, :lblDownload, :lblUpload, :btnRestartTest,
  	                  :lblWeb, :lblEmail, :lblVideo, :lblVoice
           
           TITLE = "TESTING COMPLETED"
           GOOD = "GOOD"
           QUALITY = "QUALITY"
           WEB = "Web"
           VOICE = "Voice"
           VIDEO = "Video"
           EMAIL = "Email"
           LATENCY = "Latency"
           PACKETLOSS = "Packet Loss"
           DOWNLOAD = "Download"
           UPLOAD = "Upload"

            def initialize
        	 @btnSpeedTest = CalButton.new("* id:'action_bar_title'")
        	 @lblTitle = CalLabel.new("* id:'text_status'")
        	 @lblWeb = CalLabel.new("* id:'text_web'")
        	 @lblVoice = CalLabel.new("* id:'text_voice'")
        	 @lblVideo = CalLabel.new("* id:'text_video'")
        	 @lblEmail = CalLabel.new("* id:'text_email'")
        	 @lblGood = CalLabel.new("* id:'text_quality_value'")
        	 @lblQuality = CalLabel.new("* id:'text_quality'")
        	 @lblLatency = CalLabel.new("* id:'text_latency'")
        	 @lblPacketLoss = CalLabel.new("* id:'text_packetloss'")
        	 @lblDownload = CalLabel.new("* id:'text_download'")
        	 @lblUpload = CalLabel.new("* id:'text_upload'")
        	 @btnRestartTest = CalButton.new("* id:'button_speedTest'")

        	 @@logger = OMLogger.getLogger(SpeedTestResults.name)

            end	

            def pageExists
                SpeedTestResults.new.lblLatency.waitTillAppears()
            end	
    end	
end  


class SpeedTestDefns
end


#######################################
#Step_Definations
#######################################

#SpeedTestStart 

Then(/^I assert all elements in speed test start view$/) do
    _Title = SpeedTest::SpeedTestStart::TITLE; _Message = SpeedTest::SpeedTestStart::MESSSAGE; _Cancel = SpeedTest::SpeedTestStart::CANCEL; _Start = SpeedTest::SpeedTestStart::START
	
	h = {_Title => @page.lblTitle.getText(), _Message => @page.lblMessage.getText(), _Cancel => @page.btnCancel.getText(), _Start => @page.btnStart.getText()}
	 Calx.new.AssertTextAll(h)
end
Then(/^I tap cancel on speed test start view$/) do
	@page.btnCancel.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end
Then(/^I tap start on speed test start view$/) do
	@page.btnStart.tap()
	#sleep 20
	@page = Base.new.Page(SpeedTest::SpeedTestResults)
	@page.pageExists
end
  
  #Speedtestwithnoconnection

Then(/^I assert all elements in speed test with no connection page$/) do
	_Title = SpeedTest::SpeedTestWithNoConnection::TITLE; _Message = SpeedTest::SpeedTestWithNoConnection::MESSAGE; _Cancel = SpeedTest::SpeedTestWithNoConnection::CANCEL

	h= {_Title => @page.lblTitle.getText(), _Message => @page.lblMessage.getText(), _Cancel => @page.btnCancel.getText()}
	Calx.new.AssertTextAll(h)
end
Then(/^I tap cancel on speed test with no connection page$/) do
	@page.btnCancel.tap()
	@page = Base.new.Page(DashBoard)
	@page.pageExists
end

#SpeedTestResults

Then(/^I assert all elements in speed test result view$/) do

	_Latency = SpeedTest::SpeedTestResults::LATENCY; _Packetloss = SpeedTest::SpeedTestResults::PACKETLOSS; _Download = SpeedTest::SpeedTestResults::DOWNLOAD; _Upload = SpeedTest::SpeedTestResults::UPLOAD

	 h = {_Latency => @page.lblLatency.getText(), _Packetloss => @page.lblPacketLoss.getText(), _Download => @page.lblDownload.getText(), _Upload => @page.lblUpload.getText()}
	 Calx.new.AssertTextAll(h)
end
 