class AddPprIdPprHards < ActiveRecord::Migration
  def change
    add_column :ppr_hards, :ppr_id, :integer
  end
end
