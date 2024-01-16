class Api::V0::RoadtripController < ApplicationController

  def create
    
    origin = params["origin"]
    destination = params["destination"]
    
    directions_facade = DirectionsFacade.new(origin, destination)

    forecast = directions_facade.eta_weather
    travel_time = directions_facade.travel_time

    if travel_time != nil
      render json: route(origin, destination, travel_time, forecast)
    else
      render json: no_route(origin, destination)
    end
  end

  def route(origin, destination, travel_time, forecast)
    response_data = {
      data: {
        id: nil,
        type: 'roadtrip',
        attributes: {
          start_city: origin,
          end_city: destination,
          travel_time: travel_time,
          weather_at_eta: {
            datetime: forecast["time"],
            temperature: forecast["temp_f"],
            condition: forecast["condition"]["text"]
          }
        }
      }
    }
  end
  def no_route(origin, destination)
    response_data = {
        data: {
          id: nil,
          type: 'roadtrip',
          attributes: {
            start_city: origin,
            end_city: destination,
            travel_time: 'impossible route',
            weather_at_eta: {}
          }
        }
      }
    end
  end
