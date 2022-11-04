class CreateTrip < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :zone_id
      t.datetime :start_date
      t.string :description
    end
  end
end
