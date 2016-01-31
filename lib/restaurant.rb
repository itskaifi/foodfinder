class Restaurant 
	@@filepath = nil
	
	# setter method for file path
	def self.filepath=(path=nil)
		@@filepath = File.join(APP_ROOT, path)
	end

	def self.file_exist?
		# class should know if the restaurant file exists
	end

	def self.create_file
		# create the restaurant file		
	end

	def self.save_restaurant
		# read the restaurant file
		# return instance of restaurant
	end
end