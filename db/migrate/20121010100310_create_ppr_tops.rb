class CreatePprTops < ActiveRecord::Migration
  def change
    create_table :ppr_tops do |t|
      t.integer :hard_id
      t.integer :topology_id
      t.string  :value
    end
  end
end
