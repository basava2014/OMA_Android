How to run calabash-android --

Before we start executing automated TC's using calabash-android, there are a few steps that one needs to perform. The following are the steps.

##################################

a. Copy the apk file.

Once we get the build <APK> from the B & R team, copy it to a local place or to the project dir (Ex: C:\auto-ng\calabash-android\Main\Project>)

##################################

b. Reisgn the apk file with the debug key

** Command to RUN - calabash-android resign <apk>

After the file is being copied, we need to sign the apk file with the debug key, this is done by opening the command prompt and running the above command 

##################################

c. Build the test server for the apk

** Command to RUN - calabash-android build <apk>

Once you've resigned, run the above command to build the test server for your apk

##################################

d. Run your TC

** Command to RUN - calabash-android run <apk> -p android --tag @Test01

Run your test cases by using the above command line, <-p android> switch is necessary to load the calabash-android modules, --tag specifies which TC to run, @Test01 is an annotation used on the test01 TC.
If you would like to run the entire file then use the below command

** Command to RUN - calabash-android run <apk> -p android ./features/Test.feature

##################################

e. Querying for elements on a view

** command to Run - calabash-android console <apk>

This will log you into RUBY CONSOLE, run the command to start the test server

** command to Run - start_test_server_in_background

This will start test server, which makes it possible to query for the UI elements on the view, once this is done

** command to Run - query("*")

This will list all the elements on the view with their properites.

For more info refer link -
 http://wiki.dev.ipass.com/index.php/Automation_QA/Training/Android/How_to_query_an_Android_device

##################################

If calabash-android resign/build commands doesn't work, then the setup isn't correct in which case, please contact the appropriate personal for assistance


Cheers.

#############LEARNING SOURCETREE#################

#############I'M ON EXPERIMENTAL-TEST BRANCH NOW##############


#######DEVELOP 2 AHEAD#########