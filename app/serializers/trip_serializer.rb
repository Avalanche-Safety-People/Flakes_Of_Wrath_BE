class TripSerializer
  include JSONAPI::Serializer
  attributes :name, :zone_id, :start_date, :description, :user_id
end
