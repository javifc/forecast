class ForecastsController < ApplicationController

  def index

  	res = ForecastService.find_by_city(params[:search])

  	if res[:success]
  		@forecasts = res[:forecasts]
  		@city = res[:city]
  		# session[:current_forecasts] = @forecasts
  	else
  		# return error msg
  		# session.delete(:current_forecasts)
  	end
  	
  end

  def show
  	forecasts = session[:current_forecasts]
  	# TODO: change this for a real search
  	forecasts.first
  end
end