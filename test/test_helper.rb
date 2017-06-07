require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'webmock/minitest'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  ENV['OPEN_WEATHER_API_KEY'] = '123abc321'

  WebMock.disable_net_connect!(allow_localhost: true)
 
  def stub_forecast_hsh
  	res = {"dt":1485766800,"pressure":1024.53,"humidity":76,"speed":4.57,"deg":225,"clouds":0,"snow":0.01, "units":"metric"}
  	res.merge!(stub_weather_hsh)
  	res.merge!(stub_temp_hsh)
  end

  def stub_weather_hsh 
		{"weather":[{"id":800,"main":"Clear","description":"sky is clear","icon":"01d"}]}
  end

  def stub_temp_hsh 
		{"temp":{"day":262.65,"min":261.41,"max":262.65,"night":261.41,"eve":262.65,"morn":262.65}}
  end

  def stub_city_hsh(city)
		{"city":{"geoname_id":524901,"name":"#{city}","lat":55.7522,"lon":37.6156,"country":"IE","iso2":"IE","type":"city","population":0}}
  end


  def stub_openweather_request(city, return_error=false, days=16, format="json", units="metric")
  	res = generate_mock_response(city, days, return_error)
 	url = "http://api.openweathermap.org/data/2.5/forecast/daily?q=#{city}&cnt=#{days}&units=#{units}&mode=#{format}&appid=#{ENV['OPEN_WEATHER_API_KEY']}"
  	WebMock.stub_request(:get,  url).to_return(:status => res[:cod], :body => res.to_json, :headers => {})
  end

  def generate_mock_response(city, days, error=false)

	return  {"cod":"401", "message": "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info."} if error	
	mock_response = {"cod":"200","message":0,"cnt":"#{days}"}
	mock_response.merge!(stub_city_hsh(city))
	mock_response["list"] = []
	days.times do
		mock_response["list"] << stub_forecast_hsh
	 end
	 mock_response
  end

end