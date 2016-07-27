require 'destination'
require 'support/string_extend'
class Guide
	class Config
		@@actions = ['list', 'find', 'add' , 'quit']
		def self.actions ; @@actions ; end
	end
    def initialize(path=nil)
        # locate destination
        #exit if failure
        Destination.filepath = path

        if Destination.file_usable?
        	puts 'Found Destinations File'

        elsif Destination.create_file
        	puts 'Created Destinations file'
        else
        	puts "Exiting . \n\n"
        	exit!
        end
    end
    def launch!
     	introduction
     	result = nil
     	until result == :quit
	     	action , args = get_action
	     	result  = do_action(action , args)
	    end
     	conclusion
    end
    def get_action
    	action = nil
    	until Guide::Config.actions.include?(action)
	    	puts 'Actions:' + Guide::Config.actions.join(",") if action
	    	print '>'
		    user_response = gets.chomp
		    args = user_response.downcase.strip.split(' ')
	        action = args.shift
    	end
	    return action , args

    end
    def do_action(action , args = [])
    	case action
    	when 'list'
    		list(args)
    	when 'find'
    		keyword = args.shift
            find(keyword)
    	when 'add'
    		add
    	when 'quit' 
    		return :quit
    	else
    		puts "\n I don't understand that\n"
    		
    	end
    end

    def find(keyword = "")
        output_action_header("Find a destination")
        if keyword
            destinations = Destination.saved_destinations
            found = destinations.select do |des| 
                des.name.downcase.include?(keyword.downcase) ||
                des.country.downcase.include?(keyword.downcase) ||
                des.continent.downcase.include?(keyword.downcase) ||
                des.price.to_i <= keyword.to_i
            end
            output_destination_table(found)
        else
            puts "Find using a key phrase to find destinations"
            puts "Like : 'find london , find Mexico'\n\n"
        end
    end
    def list(args = [])
        sort_order = args.shift
        sort_order = args.shift if sort_order == 'by'
        sort_order = "name" unless ['name' , 'country' , 'continent' , 'price'].include?(sort_order)
        output_action_header("Listing Destinations")
        destinations =  Destination.saved_destinations
        destinations.sort!  do |d1,d2|
            case sort_order
            when "name"
                d1.name.downcase <=> d2.name.downcase
            when "country"
                d1.country.downcase <=> d2.country.downcase
            when "continent"
                d1.continent.downcase <=> d2.continent.downcase
            when "price"
                d1.price.to_i <=> d2.price.to_i
            end 
        end
        output_destination_table(destinations)
        puts "\n\n sort using: eg 'list continent' or 'list by continent'"
    end
    def add
        output_action_header("Add a destination")
        
        destination = Destination.build_from_questions
        
        if destination.save
            output_action_header('Destination added')
        else
            output_action_header('Save error')
        end
    end
    def introduction
    	puts "\n\n <<<Welcome to the Travel Finder>>> \n\n"
    	puts "\n\n This is an interactive guide to help you find the destination you want \n\n"
    end
    

    def conclusion 
    	puts "\n\n <<<<Goodbye and Bon Voyage>>>\n\n\n"	
        output_action_header('Eric Caleb | 2016')
    end

    private
    def output_action_header(text)
        puts "\n\n #{text.upcase.center(60)}\n\n"
    end

    def output_destination_table(destinations = [])

        print " " + "Name".ljust(15)
        print " " + "Country".ljust(15)
        print " " + "Continent".ljust(15)
        print " " + "Air Price".rjust(8) + "\n"
        puts "_" * 60 + "\n\n"

        destinations.each do |des|
            line = " " << des.name.titleize.ljust(15)
            line << " " + des.country.titleize.ljust(15)
            line << " " + des.continent.titleize.ljust(15)
            line << " " + des.formatted_price.rjust(8)
            puts line
        end
        puts "No Listings Found" if destinations.empty?
        puts "_" * 60
    end
end
