class AddUsernametToAdminUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :username, :string
  end
end
