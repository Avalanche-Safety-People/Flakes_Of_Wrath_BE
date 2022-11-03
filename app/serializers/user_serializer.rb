class UserSerializer
 include JSONAPI::Serializer
 attributes :name, :favorite_zone
end