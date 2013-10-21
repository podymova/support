class CreatePprReleaseAttaches < ActiveRecord::Migration
  def change
    create_table :ppr_release_attaches do |t|
      t.integer :release_id
      t.integer :ppr_id
      t.string :asset

      t.timestamps
    end
  end
end
