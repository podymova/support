class RemoveTopologyIdFromPprHards < ActiveRecord::Migration
  def up
    remove_column :ppr_hards, :topology_id
  end

  def down
    add_column :ppr_hards, :topology_id, :integer
  end
end
