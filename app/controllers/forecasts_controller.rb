class ForecastsController < ApplicationController

  def index
  	
  	if session[params[:city].to_sym]
  		@forecasts = session[params[:city].to_sym] 
  	else
  		@forecasts = ForecastService.find_by_city(params[:city])
  	end
  end

  def show
  end
end