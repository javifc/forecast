class Forecast	

  	attr_accessor :data_time
  	attr_accessor :pressure
  	attr_accessor :humidity	
  	attr_accessor :wind_speed
  	attr_accessor :wind_direction
  	attr_accessor :clouds	

  	attr_accessor :temp
  	attr_accessor :weather

  	def initialize(hsh = {})
      self.pressure = hsh[:pressure] unless hsh[:pressure].blank?
      self.humidity = hsh[:humidity] unless hsh[:humidity].blank?
      self.wind_speed = hsh[:speed] unless hsh[:speed].blank?
      self.wind_direction = hsh[:deg] unless hsh[:deg].blank?  		
      self.clouds = hsh[:clouds] unless hsh[:clouds].blank?  	  

      self.temp =  Temperature.new(hsh[:temp]) unless hsh[:temp].blank?
      self.weather =  Weather.new(hsh[:weather][0]) unless hsh[:weather][0].blank? 		
    end
end

