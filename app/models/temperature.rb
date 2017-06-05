class Temperature

	attr_accessor :day
	attr_accessor :min	
	attr_accessor :max
	attr_accessor :night
	attr_accessor :eve
	attr_accessor :morn

	def initialize(hsh={})
		hsh.each do |name, value|
      		send("#{name}=", value) if respond_to?("#{name}=")
    	end
	end

end