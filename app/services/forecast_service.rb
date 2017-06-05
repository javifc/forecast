class ForecastService

	@base_url_find_by_city = "http://api.openweathermap.org/data/2.5/forecast/daily?"

	def self.find_by_city(city, days=16, format="json", units="metric")

		byebug

		url = @base_url_find_by_city + "q=#{city}&cnt=#{days}&units=#{units}&mode=#{format}&appid=#{ENV['OPEN_WEATHER_API_KEY']}"
		response = Net::HTTP.get(URI.parse(url))

		forecasts = []
		if response
			data = JSON.parse(response).with_indifferent_access
			if data[:cod] == "200"
				data[:list].each do |item|
					forecasts << Forecast.new(item)	
				end
			end

		end
		byebug
		forecasts

	end

end