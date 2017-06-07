require 'test_helper'
class WeatherTest < ActiveSupport::TestCase

	 test "Return a Weather model with all attributes" do  
	   	weather =  Weather.new(stub_weather_hsh[:weather][0])
	    assert weather.main ==  stub_weather_hsh[:weather][0][:main]
	    assert weather.description ==  stub_weather_hsh[:weather][0][:description]
	    assert weather.icon ==  stub_weather_hsh[:weather][0][:icon]
	  end

end