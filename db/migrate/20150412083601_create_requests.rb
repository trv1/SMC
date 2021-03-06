class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :number
      t.references :polyclinic, index: true
      t.references :post, index: true
      t.references :schedule, index: true
      t.references :routine, index: true
      t.references :user, index: true
      t.timestamp :date

      t.timestamps null: false
    end
    add_foreign_key :requests, :polyclinics
    add_foreign_key :requests, :posts
    add_foreign_key :requests, :schedules
    add_foreign_key :requests, :users
    add_foreign_key :requests, :routines
  end
end
