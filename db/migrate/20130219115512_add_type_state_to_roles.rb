class AddTypeStateToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :type_state, :string
  end
end
