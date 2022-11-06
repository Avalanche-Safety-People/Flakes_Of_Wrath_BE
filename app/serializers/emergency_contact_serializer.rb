class EmergencyContactSerializer
  include JSONAPI::Serializer
  attributes :name, :phone_number, :user_id

  def self.no_contact
    {
      "data": {
        "id": nil,
        "type": 'emergency_contact'
      }
    }
  end
end
