class RemoveValueFromPprHards < ActiveRecord::Migration
  def up
    remove_column :ppr_hards, :value
  end

  def down
    add_column :ppr_hards, :value, :string
  end
end
