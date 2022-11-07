class AreaSerializer
  include JSONAPI::Serializer
  attributes :current_av_risk, :start_date, :end_date, :name, :state, :travel_advice, :url, :av_danger

  def self.no_area
    {
      "data": {
        "id": nil,
        "type": 'area'
      }
    }
  end
end
