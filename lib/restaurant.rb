class Restaurant 
	@@filepath = nil
	
	# setter method for file path
	def self.filepath=(path=nil)
		@@filepath = File.join(APP_ROOT, path)
	end

	def self.file_exist?
		# class should know if the restaurant file exists
		if @@filepath && File.exists?(@@filepath)
			return true
		else
			return false
		end
	end

	def self.file_usable?
		return false unless @@filepath
		return false unless File.exists?(@@filepath)
		return false unless File.readable?(@@filepath)
		return false unless File.writable?(@@filepath)
		return true
	end
		

	def self.create_file
		# create the restaurant file		
		File.open(@@filepath,'w') unless file_exist?
		return file_usable?
	end

	def self.save_restaurant
		# read the restaurant file
		# return instance of restaurant
	end
end