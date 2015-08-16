class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :last_name, null: false, limit: 50
      t.string :first_name, null: false, limit: 50
      t.string :second_name, limit: 50
      t.date :birthday
      t.string :residence, null: false
      t.string :sex
      t.string :passport, null: false, limit: 10, unique: true
      t.string :policy, null: false, limit: 10, unique: true
      t.string :email, null: false, unique: true
      t.string :login, null: false, unique: true
      t.string :password_digest
      t.integer :role

      t.timestamps null: false
    end
    # reversible do |dir|
    #   dir.up do
    #     execute "alter table users add check (sex in ('м','ж'));"
    #   end
    #   dir.down do
    #   end
    # end
  end
end
