class RemovePprIdPprHardTops < ActiveRecord::Migration
  def change
    remove_column :ppr_hard_tops, :ppr_id
  end
end
