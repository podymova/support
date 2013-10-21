class RemoveHardwareIdPprHards < ActiveRecord::Migration
  def change
    remove_column :ppr_hards, :hardware_id
  end
end
