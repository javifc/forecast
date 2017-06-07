require 'test_helper'
class ForecastTest < ActiveSupport::TestCase

	 test "Return a Forecast model with all the attributes" do 
	   	forecast =  Forecast.new(stub_forecast_hsh.merge!(stub_city_hsh("dublin")))
	   	assert forecast.valid?
	   	assert forecast.errors.blank?

	    assert forecast.dt ==  stub_forecast_hsh[:dt]
	    assert forecast.pressure ==  stub_forecast_hsh[:pressure]
	    assert forecast.humidity ==  stub_forecast_hsh[:humidity]
	    assert forecast.speed ==  stub_forecast_hsh[:speed]
	    assert forecast.deg ==  stub_forecast_hsh[:deg]
	    assert forecast.clouds ==  stub_forecast_hsh[:clouds]
	    assert forecast.units ==  stub_forecast_hsh[:units]

	    assert !forecast.temp.nil?
	    assert !forecast.weather.nil?
	    assert !forecast.city.nil?
	  end


	 test "Return an Error if Weather not passed" do  
	 	hsh = stub_forecast_hsh.merge!(stub_city_hsh("dublin"))
	 	hsh.delete(:weather)
	   	forecast =  Forecast.new(hsh)
	   	assert !forecast.valid?
	   	assert !forecast.errors.blank?
	   	assert forecast.errors.full_messages == ["Weather can't be blank"]
	  end	  

	 test "Return an Error if Temperature not passed" do 
	 	hsh = stub_forecast_hsh.merge!(stub_city_hsh("dublin"))
	 	hsh.delete(:temp)
	   	forecast =  Forecast.new(hsh)
	   	assert !forecast.valid?
	   	assert !forecast.errors.blank?
	   	assert forecast.errors.full_messages == ["Temp can't be blank"]	    
	  end

	 test "Return an Error if City not passed" do 
	   	forecast =  Forecast.new(stub_forecast_hsh)
	   	assert !forecast.valid?
	   	assert !forecast.errors.blank?
	   	assert forecast.errors.full_messages == ["City can't be blank"]	    
	  end

	 test "Return an Error if date_time (dt) not passed" do  
	 	hsh = stub_forecast_hsh.merge!(stub_city_hsh("dublin"))
	 	hsh.delete(:dt)
	   	forecast =  Forecast.new(hsh)
	   	assert !forecast.valid?
	   	assert !forecast.errors.blank?
	   	assert forecast.errors.full_messages == ["Dt can't be blank"]	    
	  end	  	  
end