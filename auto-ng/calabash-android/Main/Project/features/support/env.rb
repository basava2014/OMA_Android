# Loads and runs all required files

if ENV['PLATFORM'] == 'ios'
  #Dir["../ios/*.rb"].each {|file| require file }
  	require 'calabash-cucumber/cucumber'
 elsif ENV['PLATFORM'] == 'android'
	require 'calabash-android/cucumber'
end


  #Dir["C:/Users/mhadimani/Desktop/new_framework/features/android/helpers/*"].each {|file| require file }
 # Dir["C:/Users/mhadimani/Desktop/new_framework/features/lib/*"].each {|file| require file }
#end

#puts "Loading env.rb"
#Dir["C:/Users/mhadimani/Desktop/new_framework/features/lib/*.rb"].each {|file| require file }
#Dir[File.dirname(__FILE__) + "C:\\Users\\mhadimani\\Desktop\\new_framework\\features\\lib\\*.rb"].each { |file| puts "This is my file - #{file}" }

#sleep(2)
#Support.new.Initialize()
#=end

