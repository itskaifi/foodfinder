require 'restaurant'

class Guide
	class Config
		@@actions = ['list','find','add','quit']
		def self.actions; @@actions; end
	end

	def initialize(path=nil)

		# Locate the restaurant text file
		Restaurant.filepath = path
		if Restaurant.file_usable?
			puts "Found restaurant file."
		# or create a new file
		elsif Restaurant.create_file
			puts "Create restaurant file." 
		# exit if create fails
		else
			puts "Existing.\n\n"
			exit!
		end
	end

	def launch!
		introduction
	
		# action loop
		result = nil
		until result == :quit
			action = get_action
			result = do_action(action)
		end
		conclusion
	end

	def get_action
		action = nil
		# Keep asking for user inputs untill we get a valid input
		until Guide::Config.actions.include?(action)
			puts "Action: " + Guide::Config.actions.join(",") if action
			print "> "
			user_response = gets.chomp
			action = user_response.downcase.strip
		end
		return action
	end

	def do_action(action)
		case action
			when 'list'; puts "listing..."
			when 'find'; puts "finding..."
			when 'add' ; add
			when 'quit'; return :quit
			else puts " I don't understand that Command \n"
		end
	end

	def add
		puts "\nAdd a restaurant\n\n".upcase

		restaurant = Restaurant.build_using_questions

		if restaurant.save
			puts "\nRestaurant Added \n"
		else
			puts "\nSave Error: Restaurant not added "
		end
	end

	def introduction
		puts "\n\n <<< Welcome to the Food Finder >>> \n\n"
		puts "This is an interactive guide to help you find the food you crave.\n\n"
	end

	def conclusion
		puts "\n\n <<< Goodbye and Have fun! >>> \n\n "
	end
end