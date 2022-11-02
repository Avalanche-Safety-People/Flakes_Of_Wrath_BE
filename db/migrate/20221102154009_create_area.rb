class CreateArea < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.string :url
      t.string :state
      t.integer :zone_id
      t.float :latitude
      t.float :longitude
    end
  end
end
