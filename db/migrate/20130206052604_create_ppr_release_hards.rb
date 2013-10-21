class CreatePprReleaseHards < ActiveRecord::Migration
  def change
    create_table :ppr_release_hards do |t|
      t.integer :release_id
      t.integer :ppr_id
      t.integer :hardware_id
      t.integer :topology_id
      t.string  :value

      t.timestamps
    end
  end
end
