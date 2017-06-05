class Weather

	attr_accessor :main
	attr_accessor :description	
	attr_accessor :icon

	def initialize(hsh={})
		hsh.each do |name, value|
      		send("#{name}=", value) if respond_to?("#{name}=")
    	end
	end
end