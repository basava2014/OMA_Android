##Classes
class DataUsagePanel

	class UsageMeter
    attr_accessor :btnSetLimit, :lblDataLimit, :btnUsageMeterTitle, :lblCellularData, :lblHistory, :lblWiFi, :lblCellular, :btnDay, :btnWeek, 
    :btnThreeMonth, :btnSixMonth, :lbldateinfo, :lblbillinfo, :lblMessage
     
    SETLIMIT = "Set Limit" 
		USAGEMETERTITLE = "Usage Meter"
		CELLULARDATA = "Cellular Data"
		HISTORY = "History"
		WIFI = "Wi-Fi"
		CELLULAR = "Cellular"
    MESSAGE = "The usage limit should be greater than 0, please enter a valid usage limit."

    def initialize
      @btnSetLimit = CalButton.new("* id:'action_set_limit'")
			@btnUsageMeterTitle = CalButton.new("* id:'action_bar_title'")
			@lblCellularData = CalLabel.new("* id:'usage_meter_heading_id'")
			@lblHistory = CalLabel.new("* id:'heading'")
			@btnDay =CalButton.new("* id:'btn_oneWeek'")
			@btnWeek = CalButton.new("* id:'btn_fourWeeks'")
			@btnThreeMonth = CalButton.new("* id:'btn_threeMonths'")
			@btnSixMonth = CalButton.new("* id:'btn_sixMonths'")
			@lblWiFi = CalLabel.new("textview index:1")
			@lblCellular = CalLabel.new("textview index:2")
			@lbldateinfo = CalLabel.new("* id:'usage_meter_sub_heading_id'")
			@lblbillinfo = CalLabel.new("* id:'usage_meter_remaining_id'")
      @lblDataLimit = CalLabel.new("* id:'usage_meter_limit_id'")
      @lblMessage = CalLabel.new("* id:'message'")

			@@logger = OMLogger.getLogger(UsageMeter.name)
	  end

	  def pageExists
	    UsageMeter.new.lblCellularData.waitTillAppears()
	 	end
  end

	class ApplicationDataUsage
		  attr_accessor :btnApplicationDataUsage
	
	    APPDATAUSAGE = "Application Data Usage"

    	def initialize
    		@btnApplicationDataUsage = CalButton.new("* id:'action_bar_title'")

    		@@logger = OMLogger.getLogger(ApplicationDataUsage.name)
     	end

     	def pageExists
     		ApplicationDataUsage.new.btnApplicationDataUsage.waitTillAppears()
     	end
	end

	class RecentConnections
		  attr_accessor :btnRecentConnections, :btnClear, :lblConnections

     	RECENTCONNECTIONS = "Recent Connections"

     	def initialize
     		@btnRecentConnections = CalLabel.new("* id:'action_bar_title'")
     		@btnClear = CalButton.new("* id:'action_clear'")
        @lblConnections = CalLabel.new("* id:'connection_ssid'")
     	
      	@@logger = OMLogger.getLogger(RecentConnections.name)
     	end

     	def pageExists
     		RecentConnections.new.btnRecentConnections.waitTillAppears()
     	end
	end

	class SetLimit
		    attr_accessor :btnCellularDataUsage, :lblMyBilling, :lblMyMonthlyLimit, :btnLimit, :txtLimit, :btnCal, :btnSlider, :chkAlert, :btnSave, :btnCancel, :btnCalenderPicker

        CELLULARDATAUSAGE = "Cellular Data Usage Alerts"
        MYBILLING = "My billing begins on:"
        MYMONTHLYLIMIT = "My monthly limit is:"
        ALERT ="Alert me when I am near my monthly limit."
        SAVE = "Save"
        CANCEL = "Cancel"

        def initialize
          @btnCellularDataUsage = CalButton.new("* id:'action_bar_title'")
          @lblMyBilling = CalLabel.new("robototextview index:0")
          @btnCal = CalButton.new("* id:'start_date_button'")
          @lblMyMonthlyLimit = CalLabel.new("robototextview index:2")
          @btnLimit = CalLabel.new("* id:'mds_limit'")
          @txtLimit = CalText.new("* id:'mds_limit'")
          @btnSlider = CalButton.new("* id:'text1'")
          @chkAlert = CalCheckbox.new("* id:'mds_limit_checkbox'")
          @btnSave = CalButton.new("* id:'btnLimitSave'")
          @btnCancel = CalButton.new("* id:'btnLimitCancel'")
          @btnCalenderPicker = CalButton.new("* id:'start_date_button'")

          @@logger = OMLogger.getLogger(SetLimit.name)
        end

        def pageExists
          SetLimit.new.btnCellularDataUsage.waitTillAppears()
 	      end

 	      class Calender
          attr_accessor :lblPickDate, :lblCalenderDates, :btnCaldate

 	        PICKDATE = "Select Day of Month:"

          def initialize
 	    		  @lblPickDate = CalLabel.new("* id:'title'")
 	    		  @lblCalenderDates = CalLabel.new("Textview")
            @btnCaldate = CalButton.new("textview index:28")

            @@logger = OMLogger.getLogger(Calender.name)
          end

          def pageExists
            Calender.new.lblPickDate.waitTillAppears()	
 	        end
        end
  end 
    
 
end

##Classes Defns
class DataUsagePanelDefns
  BILLING_DATE = "1"
  MONTHLY_LIMIT = "4.0"
  USAGE_MONTLY_LIMIT = "4.0GB"
  USAGE_DEFAULT_LIMIT = "1.0GB"
end

#########################
#Step_Definations
#########################

Then(/^I assert all elements in usage meter view$/) do
  _Usagemetertitle = DataUsagePanel::UsageMeter::USAGEMETERTITLE; _Cellulardata = DataUsagePanel::UsageMeter::CELLULARDATA;
  _History = DataUsagePanel::UsageMeter::HISTORY; _Wifi = DataUsagePanel::UsageMeter::WIFI; _Cellular = DataUsagePanel::UsageMeter::CELLULAR

  h = {_Usagemetertitle => @page.btnUsageMeterTitle.getText(), _Cellulardata => @page.lblCellularData.getText(), _History => @page.lblHistory.getText(),
       _Wifi => @page.lblWiFi.getText(), _Cellular => @page.lblCellular.getText() }
  Calx.new.AssertTextAll(h)
end  

Then(/^I see the default data limit in data usage panel view$/) do
    res = @page.lblDataLimit.getText 
      if res != DataUsagePanelDefns::USAGE_DEFAULT_LIMIT
        raise "Default data limit is wrong``"
      end
end

Then(/^I see the default data limit on data usage panel page after first launch$/) do
    res = @page.lblDataLimit.getText 
      if res != DataUsagePanelDefns::USAGE_MONTLY_LIMIT
        raise "Default data limit is wrong``"
      end
end

Then(/^I see the default data limit in usage settings view$/) do
  res = @page.txtLimit.getText
  puts res
  if res != DataUsagePanelDefns::MONTHLY_LIMIT
    raise "Billing start date is incorrect"
  end
end 

Then(/^I see the default date in usage settings view$/) do
  res = @page.btnCalenderPicker.getText
  puts res
  if res != DataUsagePanelDefns::BILLING_DATE
    raise "Billing start date is incorrect"
  end
end


Then(/^I assert all elements in application data usage view$/) do
  _Appdatausage = DataUsagePanel::ApplicationDataUsage::APPDATAUSAGE;
  h = {_Appdatausage => @page.btnApplicationDataUsage.getText()} 
  Calx.new.AssertTextAll(h)
end
         
Then(/^I assert all elements in recentconnections view$/) do
          _Recentconnections = DataUsagePanel::RecentConnections::RECENTCONNECTIONS;

          h = {_Recentconnections => @page.btnRecentConnections.getText()}
          Calx.new.AssertTextAll(h)

end

Then(/^I assert all elements in data limit message view$/) do
        _Message = DataUsagePanel::UsageMeter::MESSAGE;
        h = {_Message => @page.lblMessage.getText}
        Calx.new.AssertTextAll(h)
end        

Then(/^I clear recent connections$/) do
       @page.btnClear.tap()
       @page = Base.new.Page(DataUsagePanel::RecentConnections)
       @page.pageExists
end

Then(/^I should not see any network in recent connections$/) do
       @page = Base.new.Page(DataUsagePanel::RecentConnections)
       res = @page.lblConnections.getElement
       dates = Calx.new.GetTextFromElements(res)
       if dates
       puts "No Networks found in recentconnections"
       else 
        raise "Network Found"
       end
end

Then(/^I assert all elements in usage settings view$/) do 
       _Cellulardatausage = DataUsagePanel::SetLimit::CELLULARDATAUSAGE; _Mybilling = DataUsagePanel::SetLimit::MYBILLING;
       _Mymonthlylimit = DataUsagePanel::SetLimit::MYMONTHLYLIMIT; _Alert = DataUsagePanel::SetLimit::ALERT; _Save = DataUsagePanel::SetLimit::SAVE; _Cancel = DataUsagePanel::SetLimit::CANCEL

    	 h = {_Cellulardatausage => @page.btnCellularDataUsage.getText(), _Mybilling => @page.lblMyBilling.getText(),
          _Mymonthlylimit => @page.lblMyMonthlyLimit.getText(), _Alert => @page.chkAlert.getText(),_Save => @page.btnSave.getText(),_Cancel => @page.btnCancel.getText() }
        
         Calx.new.AssertTextAll(h)
end


Then(/^I tap set limit$/) do
         @page.btnSetLimit.tap()
         @page = Base.new.Page(DataUsagePanel::SetLimit)
         @page.pageExists
end 
Then(/^I set the data limit value "([^\"]*)" in usage settings view$/) do |arg1|
       @datalimit = arg1
       @page.txtLimit.tap()
       @page.txtLimit.set("")
       @page.txtLimit.set(arg1)
       #txtLimit = "edittext index:#{arg1}"
       #Calx.new.tap(txtLimit)
       @page.btnSave.tap()
       @page = Base.new.Page(DataUsagePanel::UsageMeter)
       @page.pageExists
end   
Then(/^I verify the data limit in data usage panel$/) do
     puts "@datalimit -->#{@datalimit}"
     res = @page.lblDataLimit.getText
     puts "res -->#{res}"
     #datausagelimit = Calx.new.GetTextFromElements(res)
     #puts "datausagelimit -->#{datausagelimit}"
      if res
        puts "Data limit is set -->#{res}"
      else 
        raise "Mismatched Data limit"
      end
end 
Then(/^I set monthly data limit empty and check the behavior in data usage panel$/) do
       @page.txtLimit.tap()
       @page.txtLimit.set("")
       @page.btnSave.tap()
       @page = Base.new.Page(DataUsagePanel::UsageMeter)
       @page.pageExists
       res = @page.lblDataLimit.getText 
       if res != DataUsagePanelDefns::USAGE_DEFAULT_LIMIT
        raise "Default data limit is wrong``"
      end
end

Then(/^I set 0 to monthly limit in usage settings view$/) do
       @page.btnLimit.tap()
       @page.txtLimit.set("0")
       @page = Base.new.Page(DataUsagePanel::SetLimit)
       @page.pageExists
end       
         
Then(/^I tap calender picker$/) do
  	     @page.btnCalenderPicker.tap()
  	     @page = Base.new.Page(DataUsagePanel::SetLimit::Calender)
  	     @page.pageExists
end         

Then(/^I tap cancel button in usage settings view$/) do
   @page.btnCancel.tap()
   @page = Base.new.Page(DataUsagePanel::UsageMeter)
   @page.pageExists
end

Then(/^I tap save button in usage settings view$/) do
   @page.btnSave.tap()
   @page = Base.new.Page(DataUsagePanel::UsageMeter)
   @page.pageExists
end


Then(/^I swipe right to see application data usage view$/) do
	performAction('drag',99,1,50,50,10)
	@page = Base.new.Page(DataUsagePanel::ApplicationDataUsage)
	@page.pageExists
end

Then(/^I swipe right to see recent connections view$/) do
	performAction('drag',99,1,50,50,10)
	@page = Base.new.Page(DataUsagePanel::RecentConnections)
	@page.pageExists
end

Then(/^I validate the billing period for a month on usagesetting panel$/) do
      res=`adb shell date`.delete("\r\n").split(" ")
      resMon=res[1]
      resYear=res[5]
  
      puts "resMon --> #{resMon}"
      puts "resYear --> #{resYear}"

     billingstart="since #{resMon} 1, #{resYear}"
     billingend=" days left this billing period"
  
      puts "Entered"
      res = @page.lbldateinfo.getElement
      puts res
      devicedateinfo = Calx.new.GetTextFromElements(res)[0]
      puts devicedateinfo
      puts "Exited"

     #puts "#{devicebillingStart} === #{billingstart}"
      if devicedateinfo === billingstart
      puts "Pass"
     else
     raise "Fail"
      end

     res = @page.lblbillinfo.getElement
     devicebillinginfo = Calx.new.GetTextFromElements(res)[0]

     if devicebillinginfo.include?"#{billingend}"
      puts "Pass"
     else 
     raise "Fail"
     end
end

Then(/^I validate the billing period after setting a date for a month in usagesetting panel$/) do
  res=`adb shell date`.delete("\r\n").split(" ")
      resMon=res[1]
      resYear=res[5]
  
      puts "resMon --> #{resMon}"
      puts "resYear --> #{resYear}"

     billingstart="since #{resMon} 2, #{resYear}"
     billingend=" days left this billing period"
  
      puts "Entered"
      res = @page.lbldateinfo.getElement
      puts res
      devicedateinfo = Calx.new.GetTextFromElements(res)[0]
      puts devicedateinfo
      puts "Exited"

     #puts "#{devicebillingStart} === #{billingstart}"
      if devicedateinfo === billingstart
      puts "Pass"
     else
     raise "Fail"
      end

     res = @page.lblbillinfo.getElement
     devicebillinginfo = Calx.new.GetTextFromElements(res)[0]

     if devicebillinginfo.include?"#{billingend}"
      puts "Pass"
     else 
     raise "Fail"
     end
end

Then(/^I assert all elements in the calender view$/) do
	res = @page.lblCalenderDates.getElement
	dates = Calx.new.GetTextFromElements(res)
  puts dates
  if dates
    puts "Elements present in calender view"
  else 
    raise "not present"
	#calDate = "Textview"
  #Calx.new.Tap(calDate)
  #@page = Base.new.Page(DataUsagePanel::SetLimit)
  #@page.pageExists
  end
end
    ####################################
Then(/^I should see calender picker button enabled in usage settings view$/) do
  if @page.btnCal.isEnabled()
     puts "Button is Enabled"
  else
    raise "Button Disabled"
  end
end

Then(/^I should see monthly limit button enabled$/) do

    if @page.btnLimit.isEnabled()
    puts "Button is Enabled"
    else
    raise "Button Disabled"
    end
end
Then(/^I should see save button enabled$/) do
    if @page.btnSave.isEnabled()
    puts "Button is Enabled"
    else
    raise "Button Disabled"
    end
end

Then(/^I should see cancel button enabled$/) do
    if @page.btnCancel.isEnabled()
    puts "Button is Enabled"
    else
    raise "Button Disabled"
    end
end
  
Then(/^I enabled the checkbox in usagesettings UI$/) do
  res = @page.chkAlert.isChecked
  if !res
    @page.chkAlert.tap()
  end
end

Then(/^I should see the checkbox unchecked on set limit (?:UI|ui)$/) do
  res = @page.chkAlert.isChecked()
  if !res
    puts "Checkbox is unchecked"
  end
end


Then(/^I validate the calender picker exists in usagesettings UI$/) do
    @page.btnCaldate.tap()
    @page=Base.new.Page(DataUsagePanel::SetLimit)
    @page.pageExists
    
end
   
Then(/^I set the value "([^\"]*)" on calander picker$/) do |arg1|  
  @page.btnCal.tap()
  @page=Base.new.Page(DataUsagePanel::SetLimit::Calender)
  @page.pageExists()
  calDate = "Textview index:#{arg1}"
  Calx.new.Tap(calDate)
  @page = Base.new.Page(DataUsagePanel::SetLimit)
  @page.pageExists
end
#########################
Then(/^I validate the slider exists in usagesettings (?:UI|ui)$/) do
  @page.btnSlider.tap()
  res=@page.btnSlider.getElement
  @page = Calx.new.GetTextFromElements(res)

  if @page
    puts "slider exists and slide between MB and GB"
  else
    raise "No slider present in the UI"
  end
end

Then(/^I tap data usage panel menu$/) do
  @page.btnDataUsage.tap()
  @page = Base.new.Page(DataUsagePanel::UsageMeter)
  @page.pageExists
end

Then(/^I validate the data usage panel section on dash board view$/) do
  @page.btnDataUsage.tap()
  @page = Base.new.Page(DataUsagePanel::UsageMeter)
  @page.pageExists
end  



