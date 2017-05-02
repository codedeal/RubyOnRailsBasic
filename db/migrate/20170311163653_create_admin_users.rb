class CreateAdminUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :admin_users do |t|
     t.string "first_name", :limit=>50
      t.string "last_name", :limit=>50
      t.string "email", :default=>"", :null=>false
      t.string "password", :limit=>16

      t.timestamps
    end
  end
  def down
    drop_table :users
  end
end
