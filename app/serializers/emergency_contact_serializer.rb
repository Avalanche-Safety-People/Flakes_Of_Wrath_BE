class EmergencyContactSerializer
  include JSONAPI::Serializer
  attributes :name, :phone_number, :user_id
end