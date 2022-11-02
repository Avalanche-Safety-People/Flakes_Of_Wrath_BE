class User < ApplicationRecord
 validates_presence_of :uid, :provider, :name, :email

 has_many :trips
 has_many :emergency_contacts
end
