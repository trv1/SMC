class CreateJoinTablePolyclinicPost < ActiveRecord::Migration
  def up
    create_join_table :polyclinics, :posts do |t|
      t.primary_key :polyclinic_id, :post_id
    end
    add_foreign_key :polyclinics_posts, :polyclinics
    add_foreign_key :polyclinics_posts, :posts
  end
  
  def down
    drop_join_table :polyclinics, :posts
  end
end
