class RemoveTypeFromRoleUsers < ActiveRecord::Migration
  def up
    remove_column :role_users, :type
  end

  def down
    add_column :role_users, :type, :string
  end
end
