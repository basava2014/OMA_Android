
class Android

  def initialize
    @@logger = OMLogger.getLogger(Android.name)
  end

  def RestoreBaseState
    #Disconnect from Wi-Fi
    clear_app_data
    start_test_server_in_background
  end

  def RestoreAppState
    
    options = {
      :tap => "LOC_ACCEPT",
      :page_class => WelcomePage
    }
    # Call disconnect app here
    clear_app_data
    start_test_server_in_background

    calObj = Clax.new
    calObj.IsElementPresent("LOC_ACCEPT")
    calObj.AssertText("TXT_ACCEPT",true)

    baseObj = Base.new
    baseObj.Transition(options)
  end


end
