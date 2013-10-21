class CreatePprHardTops < ActiveRecord::Migration
  def change
    create_table :ppr_hard_tops do |t|
      t.integer :ppr_id
      t.integer :hardware_id
      t.integer :topology_id
      t.string  :value
    end
  end
end
