class Area < ApplicationRecord
 validates_presence_of :name, :url, :state, :zone_id, :latitude, :longitude

 has_many :predictions
end