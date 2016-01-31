require 'restaurant'

class Guide
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
		loop do 
			# what do you want to do? (list, find, add, quit)
			print "> "
			user_response = gets.chomp
			# do that action
			result = do_action(user_response)
			# repeat until user quites
			break if result == :quit
		end
		conclusion
	end

	def do_action(action)
		case action
		when 'list'
			puts "listing..."
		when 'find'
			puts "finding..."
		when 'add'
			puts "adding...."
		when 'quit'
			return :quit
		else
			puts " I don't understand that Command \n"
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