class Trip < ApplicationRecord
 validates_presence_of :name, :trip_zone, :dates, :description

 belongs_to :user
end