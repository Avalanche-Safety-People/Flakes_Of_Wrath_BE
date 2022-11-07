class AddFavoriteZoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favorite_zone, :integer, default: 427
  end
end
