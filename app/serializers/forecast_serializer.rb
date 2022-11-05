
class ForecastSerializer
  include JSONAPI::Serializer
  attributes :max_temp, :min_temp, :description, :avg_wind_speed, :max_wind_speed

  @max_temp = attributes[:temp][:max]
  @min_temp = attributes[:temp][:min]
  @description = attributes[:weather].first[:description]
  @avg_wind_speed = attributes[:wind_speed]
  @max_wind_speed = attributes[:wind_gust]
  @attributes = attributes

  def self.no_forecast
    {
        "data": {
          "id": nil,
          "type": "emergency_contact"
        }
      }
  end
end