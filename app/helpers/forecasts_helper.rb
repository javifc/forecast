module ForecastsHelper

	@@allowed_units = %w[metric imperial standard]

	def speed_unit(unit)
		return "meter/sec".html_safe unless @@allowed_units.include? unit
		{metric: "meter/sec", imperial: "foot/sec", standard: "meter/sec"}[unit.to_sym].html_safe
	end

	def temperature_unit(unit)
		return "&deg;".html_safe unless @@allowed_units.include? unit
		{metric: "&deg;C", imperial: "&deg;F", standard: "&deg;K"}[unit.to_sym].html_safe
	end
end