class TripSerializer
  include JSONAPI::Serializer
  attributes :name, :zone_id, :start_date, :description, :user_id

  def self.no_trip
    {
        "data": {
          "id": nil,
          "type": "trip"
        }
      }
  end
end
