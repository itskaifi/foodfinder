require 'restaurant'

class Guide
	def initialize(path=nil)
		# Locate the restaurant text file
		Restaurant.filepath = path
		if Restaurant.file_exist?
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
		# what do you want to do? (list, find, add, quit)
		# do that action
		# repeat tuile user quits
		conclusion
	end

	def introduction
		puts "\n\n <<< Welcome to the Food Finder >>> \n\n"
		puts "This is an interactive guide to help you find the food you crave.\n\n"
	end

	def conclusion
		puts "\n<<< Goodbye and Have fun! >>> \n\n\n"
	end
end