require 'test_helper'
class TemperatureTest < ActiveSupport::TestCase

	 test "Return a Temperature model with all its attributes" do  
	   	temp =  Temperature.new(stub_temp_hsh[:temp])
	    assert temp.day ==  stub_temp_hsh[:temp][:day]
	    assert temp.min ==  stub_temp_hsh[:temp][:min]
	    assert temp.max ==  stub_temp_hsh[:temp][:max]
	    assert temp.night ==  stub_temp_hsh[:temp][:night]
	    assert temp.eve ==  stub_temp_hsh[:temp][:eve]	    
	    assert temp.morn ==  stub_temp_hsh[:temp][:morn]	  
	  end

end