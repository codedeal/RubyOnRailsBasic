class AddEmailToAdminUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :email, :string
  end
end
