class ForecastsController < ApplicationController

  def index

	  	res = ForecastService.find_by_city(params[:search])

	  	if res[:success]
	  		@forecasts = res[:forecasts]
	  		@city = res[:city]
	  	else
	  		flash.now[:error] = "upss.. an error occurred : #{res[:error]}"
	  		render "navigations/home"
	  	end
 	
  end


end