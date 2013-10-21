class AddHardwareIdPprHards < ActiveRecord::Migration
  def change
    add_column :ppr_hards, :hardware_id, :integer
  end
end
