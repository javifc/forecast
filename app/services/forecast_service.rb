class ForecastService

	
	@base_url_find_by_city = "http://api.openweathermap.org/data/2.5/forecast/daily?"

	def self.find_by_city(city, days=16, format="json", units="metric")

		return {success: false, error: "A city has to be provided" } if city.blank?
		url = @base_url_find_by_city + "q=#{city}&cnt=#{days}&units=#{units}&mode=#{format}&appid=#{ENV['OPEN_WEATHER_API_KEY']}"
		response = Net::HTTP.get(URI.parse(url))

		forecasts = []
		return {success: false, error: "Unexpected error, no response returned" } unless response
		data = JSON.parse(response).with_indifferent_access
		return {success: false, error: "#{data[:cod]} - #{data[:message]}" } unless data[:cod] == "200"

		data[:list].each do |item|
			item[:units] = units
			forecasts << Forecast.new(item)	
		end
		city = City.new(data[:city])
		
		{success: true, forecasts: forecasts, city: city}
		
	end

end