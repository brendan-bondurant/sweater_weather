# class CurrentWeatherSerializer
#   include JSONAPI::Serializer
#   attributes :last_updated, :temperature, :feels_like, :humidity, :uvi, :visibility, :condition_text, :condition_icon

#   def condition
#     {
#       text: object[:condition][:text],
#       icon: object[:condition][:icon]
#     }
#   end
# end
