class Api::V0::ForecastController < ApplicationController
  def index
    facade = WeatherFacade.new(params[:location]).formatted_weather_info
    render json: facade

  end

end

private

# def location_params
#   params.permit(:location)
# end