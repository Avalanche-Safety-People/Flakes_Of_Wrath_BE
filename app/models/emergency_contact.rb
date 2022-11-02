class EmergencyContact < ApplicationRecord
 validates_presence_of :name, :phone_number

 # belongs_to :user
end