class RemoveHardwareIdPprHardTops < ActiveRecord::Migration
  def change
    remove_column :ppr_hard_tops, :hardware_id
  end
end
