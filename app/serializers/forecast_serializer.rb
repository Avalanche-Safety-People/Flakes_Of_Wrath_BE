class ForecastSerializer
  include JSONAPI::Serializer
  attributes :max_temp, :min_temp, :description, :avg_wind_speed, :max_wind_speed, :id

  def self.no_forecast
    {
      "data": {
        "id": nil,
        "type": 'emergency_contact'
      }
    }
  end
end