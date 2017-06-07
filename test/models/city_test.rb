require 'test_helper'
class CityTest < ActiveSupport::TestCase

	 test "Return a City model with all attributes" do  
	   	city =  City.new(stub_city_hsh("dublin")[:city])
	    assert city.name ==  stub_city_hsh("dublin")[:city][:name]
	    assert city.country ==  stub_city_hsh("dublin")[:city][:country]
	  end

end