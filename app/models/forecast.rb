class Forecast < Base

  	attr_accessor :dt
  	attr_accessor :pressure
  	attr_accessor :humidity	
  	attr_accessor :speed
  	attr_accessor :deg
  	attr_accessor :clouds	

  	attr_accessor :temp
  	attr_accessor :weather

    attr_accessor :units
    
  	def initialize(hsh = {})
      super
      self.temp =  Temperature.new(hsh[:temp]) unless hsh[:temp].blank?
      self.weather =  Weather.new(hsh[:weather][0]) unless hsh[:weather][0].blank? 		
    end

end

