require 'singleton'
require 'json'
require 'nokogiri'
require_relative './logger.rb'
require_relative './common.rb'


class AAA
    attr :string , true
    include Singleton 
    def initialize
        @string = "aaa";
    end
    def self.change(string)
      instance.string = string
    end
end 

#a = AAA.change("simpleton");
#puts a.string

#h = [{"siteName" => "TATA", "address" => "123"}, {"siteName" => "ATA", "addres" => "456"}, {"siteName" => "ATA", "addres" => "456"}, 
#	{"siteName" => "ATA", "addres" => "4567"}]
#for data in h
	#puts data
   	#puts data.has_value?"TATA"

=begin
Then(/^I reboot the device$/) do
  `adb root`
  `adb reboot`
  sleep 60
   
  start_test_server_in_background
  #rescue => e
    #puts e.message
  #end
end

=end

class B
  class << self; attr_accessor :product end
  @product = 12


  def self.product
    puts "--> #{@product}"
  end
end

class Vars

  @class_ins_var = "class instance variable value"    #class instance variable
  @@class_var = "class variable value" #class  variable

  def self.class_method
    puts @class_ins_var
    puts @@class_var
  end

  def instance_method
    puts @class_ins_var
    puts @@class_var
  end
end

#Vars.class_method
#puts "see the difference"

#obj = Vars.new
#obj.instance_method

#class VarsChild < Vars
#end

#puts "Inheritence values"
#VarsChild.class_method

class Z

  def X(a)
    case a
    when "A"
      A
    end
  end

  def A
    puts "Pass"
  end
end

#Z.new.X("A")





