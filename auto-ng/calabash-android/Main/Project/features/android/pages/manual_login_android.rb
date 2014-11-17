#Manual_Login.rb

class ManualLogin

  attr_accessor :btnTitle, :lblNetworkMessage, :btnAddnew, :btnSave, :btnCancel, :txtSSID, :btnDelete

  TITLE = "Manual Login"
  #MESSAGE = "iPass Open Mobile"
  NETWORKMESSAGE = "Enter the network name (SSID) of any networks that you do not want iPass Open Mobile to log in to."
  ADDNEW = "Add new"
  SAVE = "Save"
  CANCEL = "Cancel"

  def initialize
      
   	@btnTitle = CalButton.new("* id:'action_bar_title'")
   	#@lblMessage = CalLabel.new("* id:'app_name'")
   	@lblNetworkMessage = CalLabel.new("* id:'prompt'")
   	@btnAddnew = CalButton.new("* id:'btnAddNewItem'")
   	@txtSSID = CalText.new("* id:'editText'")
   	#@txtSSID = CalText.new("* id:'editText' * contentDescription:nil")
   	@btnSave = CalButton.new("* id:'btnSave'")
   	@btnCancel = CalButton.new("* id:'btnCancel'")
    @btnDelete = CalButton.new("* id:'btnDelete'")

   	@@logger = OMLogger.getLogger(ManualLogin.name)
  end

  def pageExists()
		ManualLogin.new.btnAddnew.waitTillAppears()
  end

    class ManualLoginNetworks
      MANUALLOGINSSID = "IAT-PROXY"
      SSIDS = ["IAT-GIS", "IAT-PSK","IAT-COLUBRIS","IAT-WEP","iPassSOA","iPassSO","attwifi","IAT-NOIP","IAT-UAM","ibahn"]
  end

end

######################################################################
#Step_definations
######################################################################

Then(/^I assert all elements in manual login UI$/) do
  _Title = ManualLogin::TITLE; _NetworkMessage = ManualLogin::NETWORKMESSAGE; _Addnew = ManualLogin::ADDNEW;
  _Save = ManualLogin::SAVE; _Cancel = ManualLogin::CANCEL
	
  h = {_Title => @page.btnTitle.getText(), _NetworkMessage => @page.lblNetworkMessage.getText(),
  	_Addnew => @page.btnAddnew.getText(), _Save => @page.btnSave.getText(), _Cancel => @page.btnCancel.getText() }

  	Calx.new.AssertTextAll(h)
end

Then(/^I add a new network$/) do
  @page.btnAddnew.tap()
  @page.txtSSID.set(ManualLogin::ManualLoginNetworks::MANUALLOGINSSID)
  @page.btnSave.tap()
  @page = Base.new.Page(OptionNetwork)
  @page.pageExists()
end
   
Then(/^I add 10 new networks$/) do
    arr = ManualLogin::ManualLoginNetworks::SSIDS
    arr.each_with_index do |str, index|
    puts "index --> #{index}"
    puts "str --> #{str}"
 		
    @page.btnAddnew.tap()
    Calx.new.SetText(str,"* id:'editText' index:#{index}")
 		performAction("scroll_down")
 		sleep 1
    end
     #@page.btnSave.tap()
end

Then(/I delete "([^\"]*)" network from manual login view$/) do |arg1|
    
    @deletedNetwork = arg1
    #count = 0
    res = @page.txtSSID.getElement
    ssids = Calx.new.GetTextFromElements(res)
    len = res.length
    #puts "Length --> #{len}"

    eleIndex = ssids.index(arg1)
    delElement = Calx.new.Tap("* id:'btnDelete' index:#{eleIndex}")
    puts "Deleted ssid - #{arg1}"

    @page.btnSave.tap()
    @page = Base.new.Page(OptionNetwork)
    @page.pageExists()
end

Then(/^I verify if the deleted network is removed from the list$/) do
  #@deletedNetwork = "iRoam"
  #puts "@deletedNetwork --> #{@deletedNetwork}"
  #step 'I should not see "@deletedNetwork"'
  @page = Base.new.Page(ManualLogin)
  res = @page.txtSSID.getElement
  #puts "Res --> #{res}"
  networks = Calx.new.GetTextFromElements(res)
  #puts "networks --> #{networks}"

  if networks.include?@deletedNetwork
    puts "Fail - Found network -- #{@deletedNetwork}"
  else
    puts "Pass - Couldn't find network"
  end
end

Then(/^I should see save button enabled on manual login view$/) do
  if @page.btnSave.isEnabled()
    puts "Button is Enabled"
  else
    raise "Button Disabled"
  end
end