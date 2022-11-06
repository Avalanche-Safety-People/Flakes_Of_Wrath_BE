class AreaSerializer
  include JSONAPI::Serializer
  attributes :current_av_risk, :forecast_date, :name, :state, :travel_advice, :url, :zone_id

  def self.no_area
    {
      "data": {
        "id": nil,
        "type": 'area'
      }
    }
  end
end
