require 'test_helper'
class ForecastServiceTest < ActiveSupport::TestCase

	 test "Return error if city not provided" do
	    res = ForecastService.find_by_city(nil)
	    assert res[:success] ==  false
	    assert res[:error] == "A city has to be provided"
	  end

	  test "Return error is request is not correct" do
	  	
	  	stub_openweather_request("dublin", true)
	    res = ForecastService.find_by_city("dublin")
	    assert res[:success] ==  false
	    assert !res[:error].nil?
	    assert res[:city].nil?
	    assert res[:forecasts].nil?
	  end

	  test "Return correct data if city is found" do
	  	city = "dublin"
	  	stub_openweather_request(city, false)
	    res = ForecastService.find_by_city(city)
	    assert res[:success] ==  true
	    assert res[:error].nil?
	    assert !res[:city].nil?
	    assert !res[:forecasts].nil?
	    assert res[:forecasts].size == 16
	    assert res[:city].name == city
	  end

end