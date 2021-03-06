class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.references :polyclinic, index: true
      t.references :post, index: true
      t.references :schedule, index: true
      t.time :timing

      t.timestamps null: false
    end
    add_foreign_key :routines, :polyclinics
    add_foreign_key :routines, :posts
    add_foreign_key :routines, :schedules
  end
end
