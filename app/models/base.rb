class Base
	
	include ActiveModel::Model
	
	def initialize(hsh={})
		hsh.each do |name, value|
      		send("#{name}=", value) if respond_to?("#{name}=")
    	end
	end
	
end