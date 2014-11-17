### Classes#####

 class Help
	  attr_accessor :btnTitle, :btnServiceOverview, :btnInterfacehelp, :btnFaq, :btnReportProblem

	    TITLE = "Help"
	    SERVICEOVERVIEW = "Service Overview"
        INTERFACEHELP = "Interface Help"
	    FAQ = "FAQ"
        REPORTPROBLEM = "Report a Problem"

        def initialize
        	@btnTitle = CalButton.new("* id:'action_bar_title'")
        	@btnServiceOverview = CalButton.new("* id:'tv_help' index:0")
            @btnInterfacehelp = CalButton.new("* id:'tv_help' index:1")
        	@btnFaq = CalButton.new("* id:'tv_help' index:2")
        	@btnReportProblem = CalButton.new("* id:'tv_help' index:3")

        	@@logger = OMLogger.getLogger(Help.name)
        end	

        def pageExists
        	Help.new.btnTitle.waitTillAppears()
        end	
 end        

class ServiceOverview

	class GlobalWiFi  
		attr_accessor :btnTitle, :lblProvider, :lblHotel, :lblCafe, :lblRestaurant, :lblAirport, :lblIpass, :lblIpassDescription, :lblHotels, :lblCoffeShop, 
		              :lblRestaurants, :lblAirports, :lblOther

		 TITLE = "Tour" 
		 PROVIDER = "GLOBAL Wi-Fi PROVIDER"
		 HOTEL = "Hotels"
		 CAFE = "Cafes"
		 RESTAURANT = "Restaurants"
		 AIRPORT = "Airports" 
		 IPASS = "WHAT IS IPASS?"
		 IPASSDESCRIPTION = "iPass enables you to stay connected when traveling to:"
		 HOTELS = "Hotels"
		 COFFESHOP = "Coffee shops"
		 RESTAURANTS = "Restaurants"
		 AIRPORTS = "Airports"
		 OTHER = "Other paid wireless hotspot locations"    
         
        def initialize
        	@btnTitle = CalButton.new("* marked:'#{Translate.new.OM_Translate("Tour")}'")
        	@lblProvider = CalLabel.new("* marked:'#{Translate.new.OM_Translate("GLOBAL Wi-Fi PROVIDER")}'")
        	@lblHotel = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Hotels")}'")
        	@lblRestaurant = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Restaurants")}'")
        	@lblCafe = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Cafes")}'")
        	@lblAirport = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Airports")}'")
        	@lblIpass = CalLabel.new("* marked:'#{Translate.new.OM_Translate("WHAT IS IPASS?")}'")
        	@lblIpassDescription = CalLabel.new("* marked:'#{Translate.new.OM_Translate("iPass enables you to stay connected when traveling to:")}'")
        	@lblHotels = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Hotels")}'")
        	@lblCoffeShop = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Coffee shops")}'")
        	@lblRestaurants = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Restaurants")}'")
        	@lblAirports = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Airports")}'")
        	@lblOther = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Other paid wireless hotspot locations")}'")

            @@logger = OMLogger.getLogger(GlobalWiFi.name)

         end

         def pageExists
           GlobalWiFi.new.btnTitle.waitTillAppears()	
         end
    end

    class HassleFreeConnectivity
     	attr_accessor :btnTitle, :lblConnectivity, :lblHotspot, :lblRoaming, :lblCreditcard, :lblBills,
     	              :lblIpass, :lblConnected, :lblAccess, :lblReduceCost, :lblConnectEasily, :lblEliminateBills

     	 TITLE = "Tour"
     	 CONNECTIVITY = "HASSLE FREE CONNECTIVITY"
     	 HOTSPOT = "Worldwide Hotspots"
     	 ROAMING = "Wi-Fi Roaming"
     	 CREDITCARD = "No Credit Cards"
     	 BILLS = "No Multiple Bills"
     	 IPASS = "WHY SHOULD I USE IPASS?"
     	 CONNECTED = "Be well connected everywhere with the world's largest commercial Wi-Fi network."
     	 ACCESS = "Access over two million hotspots worldwide"
     	 REDUCECOST = "Reduce cellular roaming costs" 
     	 CONNECTEASILY = "Connect easily without webpages or credit cards"
     	 ELEMINATEBILLS = "Eliminate multiple bills and expense reports"

     	 def initialize
     	 	@btnTitle = CalButton.new("* marked:'#{Translate.new.OM_Translate("Tour")}'")
     	 	@lblConnectivity = CalLabel.new("* marked:'#{Translate.new.OM_Translate("HASSLE FREE CONNECTIVITY")}'")
     	 	@lblHotspot = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Worldwide Hotspots")}'")
     	 	@lblRoaming = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Wi-Fi Roaming")}'")
     	 	@lblCreditcard = CalLabel.new("* marked:'#{Translate.new.OM_Translate("No Credit Cards")}'")
     	 	@lblBills = CalLabel.new("* marked:'#{Translate.new.OM_Translate("No Multiple Bills")}'")
     	 	@lblIpass = CalLabel.new("* marked:'#{Translate.new.OM_Translate("WHY SHOULD I USE IPASS\?")}'")
     	 	#@lblConnected = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Be well connected everywhere with the world\'s largest commercial Wi\-Fi network.")}'")
            @lblConnected = CalLabel.new("* id:'detailed_ans_text_line1'")
     	 	@lblAccess = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Access over two million hotspots worldwide")}'")
     	 	@lblReduceCost = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Reduce cellular roaming costs")}'")
     	 	@lblConnectEasily = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Connect easily without webpages or credit cards")}'")
     	 	@lblEliminateBills = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Eliminate multiple bills and expense reports")}'")


            @@logger = OMLogger.getLogger(HassleFreeConnectivity.name)
     	 end  

     	 def pageExists
     	 	HassleFreeConnectivity.new.btnTitle.waitTillAppears()
     	 end          

    end	

    class ActivationGetStarted
     	attr_accessor :btnTitle, :lblActivation, :lblActivationCode, :lblOr, :lblEmail, :lblGetStarted, :lblDescription,
     	              :lblCode, :lblCorpEmail, :lblNote


     	 
     	 TITLE= "Tour"
     	 ACTIVATION = "ACTIVATION"
     	 ACTIVATIONCODE = "Activation Code"
     	 OR = "OR"
     	 EMAIL = "Email Address"
     	 GETSTARTED = "HOW DO I GET STARTED?"
     	 DESCRIPTION = "All you need is an iPass account and one of the following:"
     	 CODE = "An activation code"
     	 CORPEMAIL = "A corporate email address"
     	 NOTE = "Note: If neither of these options work contact your company's IT administrator."

     	 def initialize
     	 	@btnTitle = CalButton.new("* marked:'#{Translate.new.OM_Translate("Tour")}'")
     	 	@lblActivation = CalLabel.new("* marked:'#{Translate.new.OM_Translate("ACTIVATION")}'")
     	 	@lblActivationCode = CalLabel.new("* marked:'Activation Code' index:1")
            @lblOr = CalLabel.new("* marked:'#{Translate.new.OM_Translate("OR")}'")
            @lblEmail = CalLabel.new("* id:'textView7'")
     	    @lblGetStarted = CalLabel.new("* marked:'#{Translate.new.OM_Translate("HOW DO I GET STARTED?")}'")
     	 	@lblDescription = CalLabel.new("* marked:'#{Translate.new.OM_Translate("All you need is an iPass account and one of the following:")}'")
     	 	@lblCode = CalLabel.new("* marked:'#{Translate.new.OM_Translate("An activation code")}'")
     	 	@lblCorpEmail = CalLabel.new("* marked:'#{Translate.new.OM_Translate("A corporate email address")}'")
     	 	@lblNote = CalLabel.new("* id:'textView10'")

            @@logger = OMLogger.getLogger(ActivationGetStarted.name)
     	 end  

     	 def pageExists
     	 	ActivationGetStarted.new.btnTitle.waitTillAppears()
     	 end	

    end 

    class ConnectingEasy
     	attr_accessor :btnTitle, :lblConnect, :lblConnDescription, :lblAccountInfoMessage

     	  TITLE = "Tour"
     	  #CONNEASY = "CONNECTING IS EASY"
     	  #DASHBOARD = "Dashboard"
     	  #MESSAGE = "Tap on Tap to Connect."
     	  #SELNETWORK = "Select Network"
     	  #TAPMESSAGE = "Tap on the network with the iPass icon next to it and then tap OK."
     	  CONNECT = "HOW DO I CONNECT?"
     	  CONNDESCRIPTION = "Tap on a network with an iPass icon next to it. If you haven't saved your iPass account information yet, you will be prompted to enter it before you connect."
     	  ACCOUNTINFOMESSAGE = "Note: If your company has a special configuration that automatically assigns credentials, you may not need to enter any account information."

     	  def initialize
     	  	@btnTitle = CalButton.new("* marked:'#{Translate.new.OM_Translate("Tour")}'")
     	  	#@lblConnEasy = CalLabel.new("* marked:'#{Translate.new.OM_Translate("CONNECTING IS EASY")}'")
     	  	#@lblDashoard = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Dashboard")}'")
     	  	#@lblMessage = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Tap on Tap to Connect.")}'")
     	  	#@lblSelNetwork = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Select Network")}'")
     	  	#@lblTapMessage = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Tap on the network with the iPass icon next to it and then tap OK.")}'")
     	  	@lblConnect = CalLabel.new("* marked:'#{Translate.new.OM_Translate("HOW DO I CONNECT?")}'")
     	  	#@lblConnDescription = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Tap on a network with an iPass icon next to it. If you haven't saved your iPass account information yet, you will be prompted to enter it before you connect.")}'")
            @lblConnDescription = CalLabel.new("* id:'textView8' index:0")
     	  	@lblAccountInfoMessage = CalLabel.new("* id:'textView8' index:1")

     	  	@@logger = OMLogger.getLogger(ConnectingEasy.name)

     	  end	

     	  def pageExists
     	   ConnectingEasy.new.btnTitle.waitTillAppears()
     	  end	
    end

    class NeedMoreHelp
     	attr_accessor :btnTitle, :lblTour, :lblHelpInfo, :lblMessage
  
          TITLE = "Tour"
          HELPINFO = "NEED MORE HELP?"
          MESSAGE = "Open the App menu and tap Help"

          def initialize
          	@btnTitle = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Tour")}'")
          	@lblHelpInfo = CalLabel.new("* marked:'#{Translate.new.OM_Translate("NEED MORE HELP?")}'")
          	@lblMessage = CalLabel.new("* marked:'#{Translate.new.OM_Translate("Open the App menu and tap Help")}'")

          	@@logger = OMLogger.getLogger(NeedMoreHelp.name)
          end	

          def pageExists
             NeedMoreHelp.new.btnTitle.waitTillAppears()
          end	
    end
end     

class HelpDefns
end

###############Step_Definations#####################################################

Then(/^I assert all elements in help page and see take a tour option exists in the UI$/) do 
	  _Title = Help::TITLE; _Serviceoverview = Help::SERVICEOVERVIEW; _Faq = Help::FAQ; _Reportproblem = Help::REPORTPROBLEM;

	  h = {_Title => @page.btnTitle.getText(), _Serviceoverview => @page.btnServiceOverview.getText(), _Faq => @page.btnFaq.getText(), _Reportproblem => @page.btnReportProblem.getText()}

	  Calx.new.AssertTextAll(h)
end 
Then(/^I tap serviceoverview button$/) do
	@page.btnServiceOverview.tap()
	@page = Base.new.Page(ServiceOverview::GlobalWiFi)
	@page.pageExists
end
Then(/^I assert all elements on 1st page of serviceoveview$/) do
	_Title = ServiceOverview::GlobalWiFi::TITLE; _Provider = ServiceOverview::GlobalWiFi::PROVIDER;
    _Hotel = ServiceOverview::GlobalWiFi::HOTEL; _Cafe = ServiceOverview::GlobalWiFi::CAFE; _Restaurant = ServiceOverview::GlobalWiFi::RESTAURANT;
    _Airport = ServiceOverview::GlobalWiFi::AIRPORT; _Ipass = ServiceOverview::GlobalWiFi::IPASS; _Ipassdescription = ServiceOverview::GlobalWiFi::IPASSDESCRIPTION;
    _Hotels = ServiceOverview::GlobalWiFi::HOTELS; _Coffeshop = ServiceOverview::GlobalWiFi::COFFESHOP; _Restaurants = ServiceOverview::GlobalWiFi::RESTAURANTS;
    _Airports = ServiceOverview::GlobalWiFi::AIRPORTS; _Other = ServiceOverview::GlobalWiFi::OTHER

     h = {_Title => @page.btnTitle.getText(), _Provider => @page.lblProvider.getText(), _Hotel => @page.lblHotel.getText(),
          _Cafe => @page.lblCafe.getText(), _Restaurant => @page.lblRestaurant.getText(), _Airport => @page.lblAirport.getText(),
          _Ipass => @page.lblIpass.getText(), _Ipassdescription => @page.lblIpassDescription.getText(), _Hotels => @page.lblHotels.getText(),
           _Coffeshop => @page.lblCoffeShop.getText(), _Restaurants => @page.lblRestaurants.getText(), _Airports => @page.lblAirports.getText(),
           _Other => @page.lblOther.getText()} 
      Calx.new.AssertTextAll(h)     
end
Then(/^I assert all elements on 2nd page of serviceoverview$/) do

     _Title = ServiceOverview::HassleFreeConnectivity::TITLE; _Connectivity = ServiceOverview::HassleFreeConnectivity::CONNECTIVITY;
     _Hotspot = ServiceOverview::HassleFreeConnectivity::HOTSPOT; _Roaming = ServiceOverview::HassleFreeConnectivity::ROAMING; _Creditcard = ServiceOverview::HassleFreeConnectivity::CREDITCARD;
     _Bills = ServiceOverview::HassleFreeConnectivity::BILLS; _Ipass = ServiceOverview::HassleFreeConnectivity::IPASS; _Connected = ServiceOverview::HassleFreeConnectivity::CONNECTED;
     _Access = ServiceOverview::HassleFreeConnectivity::ACCESS; _Reducecost = ServiceOverview::HassleFreeConnectivity::REDUCECOST;
     _Connecteasily = ServiceOverview::HassleFreeConnectivity::CONNECTEASILY; _Eleminatebills = ServiceOverview::HassleFreeConnectivity::ELEMINATEBILLS
     
     h = {_Title => @page.btnTitle.getText(), _Connectivity => @page.lblConnectivity.getText(),
          _Hotspot => @page.lblHotspot.getText(), _Roaming => @page.lblRoaming.getText(), _Creditcard => @page.lblCreditcard.getText(),
          _Bills => @page.lblBills.getText(), _Ipass => @page.lblIpass.getText(), _Connected => @page.lblConnected.getText(),
          _Access => @page.lblAccess.getText(), _Reducecost => @page.lblReduceCost.getText(), _Connecteasily => @page.lblConnectEasily.getText(),
          _Eleminatebills => @page.lblEliminateBills.getText()}
         
     Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on 3rd page of serviceoverview$/) do
     _Title = ServiceOverview::ActivationGetStarted::TITLE; _Activation = ServiceOverview::ActivationGetStarted::ACTIVATION;
     _Activationcode = ServiceOverview::ActivationGetStarted::ACTIVATIONCODE; _Or = ServiceOverview::ActivationGetStarted::OR; _Email = ServiceOverview::ActivationGetStarted::EMAIL;
     _Getstarted = ServiceOverview::ActivationGetStarted::GETSTARTED; _Description = ServiceOverview::ActivationGetStarted::DESCRIPTION;
     _Code = ServiceOverview::ActivationGetStarted::CODE; _Corpemail = ServiceOverview::ActivationGetStarted::CORPEMAIL; _Note = ServiceOverview::ActivationGetStarted::NOTE

     h = {_Title => @page.btnTitle.getText(), _Activation => @page.lblActivation.getText(),
          _Activationcode => @page.lblActivationCode.getText(), _Or => @page.lblOr.getText(), _Email => @page.lblEmail.getText(),
          _Getstarted => @page.lblGetStarted.getText(), _Description => @page.lblDescription.getText(), _Code => @page.lblCode.getText(),
          _Corpemail => @page.lblCorpEmail.getText(), _Note => @page.lblNote.getText()}

          Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on 4th page of serviceoverview$/) do
     _Title = ServiceOverview::ConnectingEasy::TITLE; _Connect = ServiceOverview::ConnectingEasy::CONNECT; _Conndescription = ServiceOverview::ConnectingEasy::CONNDESCRIPTION;
     _Accountinfomessage = ServiceOverview::ConnectingEasy::ACCOUNTINFOMESSAGE

     h = {_Title => @page.btnTitle.getText(), _Connect => @page.lblConnect.getText(), _Conndescription => @page.lblConnDescription.getText(),
          _Accountinfomessage => @page.lblAccountInfoMessage.getText()}

          Calx.new.AssertTextAll(h)
end

Then(/^I assert all elements on 5th page of overserview$/) do
     _Title = ServiceOverview::NeedMoreHelp::TITLE; _Helpinfo = ServiceOverview::NeedMoreHelp::HELPINFO;
     _Message = ServiceOverview::NeedMoreHelp::MESSAGE

     h = {_Title => @page.btnTitle.getText(), _Helpinfo => @page.lblHelpInfo.getText(), _Message => @page.lblMessage.getText()}

     Calx.new.AssertTextAll(h)
end

Then(/^I swipe right to see 2nd page of serviceoverview$/) do
    performAction('drag',99,1,50,50,10)
    @page = Base.new.Page(ServiceOverview::HassleFreeConnectivity)
    @page.pageExists
end
Then(/^I swipe right to see 3rd page of serviceoverview$/) do
    performAction('drag',99,1,50,50,10)
    @page = Base.new.Page(ServiceOverview::ActivationGetStarted)
    @page.pageExists
end
Then(/^I swipe right to see 4th page of serviceoverview$/) do
    performAction('drag',99,1,50,50,10)
    @page = Base.new.Page(ServiceOverview::ConnectingEasy)
    @page.pageExists
end
Then(/^I swipe right to see 5th page of serviceoverview$/) do
    performAction('drag',99,1,50,50,10)
    @page = Base.new.Page(ServiceOverview::NeedMoreHelp)
    @page.pageExists
end
Then(/^I swipe left to see 4th page of serviceoverview$/) do
    performAction('drag',1,99,50,50,10)
    @page = Base.new.Page(ServiceOverview::ConnectingEasy)
    @page.pageExists
end
Then(/^I swipe left to see 3rd page of serviceoverview$/) do
    performAction('drag',1,99,50,50,10)
    @page = Base.new.Page(ServiceOverview::ActivationGetStarted)
    @page.pageExists
end

Then(/^I swipe left to see 2nd page of serviceoverview$/) do
    performAction('drag',1,99,50,50,10)
    @page = Base.new.Page(ServiceOverview::HassleFreeConnectivity)
    @page.pageExists
end

Then(/^I swipe left to see 1st page of serviceoverview$/) do
    performAction('drag',1,99,50,50,10)
    @page = Base.new.Page(ServiceOverview::GlobalWiFi)
    @page.pageExists
end

Then (/^I go back to see help view$/) do
 `adb shell input keyevent 4`
  @page =Base.new.Page(Help)
  @page.pageExists
end

Then (/^I go back to see dashboard view$/) do
 `adb shell input keyevent 4`
  @page =Base.new.Page(DashBoard)
  @page.pageExists
end  