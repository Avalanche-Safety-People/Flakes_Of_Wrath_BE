class AreaSerializer
  include JSONAPI::Serializer
  attributes :current_av_risk, :start_date, :end_date, :name, :state, :travel_advice, :url, :av_danger, :lat_long

  def self.no_area
    {
      "data": {
        "id": nil,
        "type": 'area'
      }
    }
  end

  def self.no_area_array
    {
      "data": [{
        "id": nil,
        "type": 'area'
      }]
    }
  end
end
