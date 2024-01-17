class Api::V0::RoadtripController < ApplicationController

  def create
    if @user = User.find_by(api_key: params[:api_key])
      origin = params["origin"]
      destination = params["destination"]
      directions_facade = DirectionsFacade.new(origin, destination)
      forecast = directions_facade.eta_weather
      travel_time = directions_facade.travel_time
      if travel_time.nil?
        render json: no_route(origin, destination)
      else
        time = formatted_time(travel_time)
        render json: route(origin, destination, time, forecast)
      end
    else
      render json: { errors: [{ detail: "Credentials are bad" }] }, status: :bad_request
    end
  end
  private

  def route(origin, destination, formatted_time, forecast)
    response_data = {
      data: {
        id: nil,
        type: 'roadtrip',
        attributes: {
          start_city: origin,
          end_city: destination,
          travel_time: formatted_time,
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

  def formatted_time(travel_time)
    hrs_to_days = travel_time.split(":").map(&:to_i)
    if hrs_to_days[0] >= 24
      total_hrs = hrs_to_days.shift
      days = (total_hrs / 24)
      hours =  (total_hrs % 24)
      hrs_to_days.unshift(hours)
      hrs_to_days.unshift(days).map(&:to_s)
      hrs_to_days.map!(&:to_s)
      "#{hrs_to_days[0]} days, #{hrs_to_days[1]} hours, #{hrs_to_days[2]} minutes, #{hrs_to_days[3]} seconds"
    else hrs_to_days.count == 3
      "#{hrs_to_days[0]} hours, #{hrs_to_days[1]} minutes, #{hrs_to_days[2]} seconds"
    end
  end
end
