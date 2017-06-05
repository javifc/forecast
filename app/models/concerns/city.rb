class City 

	include ActiveModel::Model
	
	attr_accessor :name
	attr_accessor :country
	attr_accessor :lon
	attr_accessor :lat

	def initialize(attributes = {})

	end
end