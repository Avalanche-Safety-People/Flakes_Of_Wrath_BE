class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :name
      t.string :email
      t.integer :favorite_zone

      t.timestamps
    end
  end
end
