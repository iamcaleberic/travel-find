require "support/number_helper"
class Destination
	include NumberHelper
	@@filepath = nil
	attr_accessor :name ,:country ,:continent , :price

	def self.filepath=(path=nil)
		@@filepath = File.join(APP_ROOT, path)
	end

	def self.file_exists?
		if @@filepath && File.exist?(@@filepath)
			return true
		else 
			return false
		end
	end
	def self.file_usable?
		return false unless @@filepath
		return false unless File.exist?(@@filepath)	
		return false unless File.readable?(@@filepath)
		return false unless File.writable?(@@filepath)
		return true
	end

	def self.create_file

		File.open(@@filepath , 'w') unless file_exists?
		return file_usable?


	end
	def self.saved_destinations
		destinations = []
		if file_usable?
			
			file = File.new(@@filepath , 'r') 
			file.each_line do  |line|
				destinations << Destination.new.import_line(line.chomp)
			end
			file.close

		end
		 return destinations

	end

	def self.build_from_questions
		args = {}
        print "Destination name:"
        args[:name] = gets.chomp.strip
        print "Destination country:"
        args[:country] = gets.chomp.strip
        print "Continent of destination:"
        args[:continent] = gets.chomp.strip
        print "Air Price:"
        args[:price] = gets.chomp.strip

        return self.new(args)
		
	end

	def initialize(args = {})
		@name =  args[:name] || ""
		@country = args[:country] || ""
		@continent = args[:continent] || ""
		@price = args[:price] || ""
	end

	def import_line(line)
		line_array = line.split("\t")
		@name , @country , @continent  ,@price= line_array
		return self
	end
	def save
		return false unless Destination.file_usable?
		File.open(@@filepath , 'a') do |file|
			file.puts "#{[@name, @country , @continent , @price].join("\t")}\n"
		end
		
		return true
	end
	def formatted_price 
		number_to_currency(@price)
	end
end