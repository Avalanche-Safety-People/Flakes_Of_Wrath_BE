class CreateEmergencyContact < ActiveRecord::Migration[5.2]
  def change
    create_table :emergency_contacts do |t|
      t.string :name
      t.string :phone_number
    end
  end
end
