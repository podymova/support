class AddHardIdToPprHardTops < ActiveRecord::Migration
  def change
    add_column :ppr_hard_tops, :hard_id, :integer
  end
end
