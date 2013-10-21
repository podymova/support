class AddTypeToRoleUsers < ActiveRecord::Migration
  def change
    add_column :role_users, :type, :string
  end
end
