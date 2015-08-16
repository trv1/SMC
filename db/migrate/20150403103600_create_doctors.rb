class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :second_name, null: false
      t.references :polyclinic, index: true

      t.timestamps null: false
    end
    add_foreign_key :doctors, :polyclinics
  end
end
