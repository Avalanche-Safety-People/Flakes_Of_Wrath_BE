class CreateTrip < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :trip_zone
      t.string :dates
      t.string :description
    end
  end
end
