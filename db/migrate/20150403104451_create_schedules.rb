class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :polyclinic, index: true
      t.references :post, index: true
      t.references :doctor, index: true
      t.timestamp :scheduleday, null: false
      t.string :cabinet, null: false
      t.time :time_begin, null: false
      t.time :time_end, null: false

      t.timestamps null: false
    end
    add_foreign_key :schedules, :polyclinics
    add_foreign_key :schedules, :posts
    add_foreign_key :schedules, :doctors
  end
end
