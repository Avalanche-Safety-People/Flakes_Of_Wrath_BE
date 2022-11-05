class Trip < ApplicationRecord
  validates_presence_of :name, :zone_id, :start_date, :description

  belongs_to :user
end