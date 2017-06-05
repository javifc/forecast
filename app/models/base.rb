class Base

	def initialize(hsh={})
		hsh.each do |name, value|
      		send("#{name}=", value) if respond_to?("#{name}=")
    	end
	end
	
end