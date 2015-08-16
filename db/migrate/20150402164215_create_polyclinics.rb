class CreatePolyclinics < ActiveRecord::Migration
  def change
    create_table :polyclinics do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :address, null: false
      t.string :district, null: false
      t.string :locality, null: false

      t.timestamps null: false
    end
  end
end
