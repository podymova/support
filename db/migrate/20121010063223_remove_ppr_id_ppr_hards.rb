class RemovePprIdPprHards < ActiveRecord::Migration
  def change
    remove_column :ppr_hards, :ppr_id
  end
end
