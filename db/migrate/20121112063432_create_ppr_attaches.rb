class CreatePprAttaches < ActiveRecord::Migration
  def change
    create_table :ppr_attaches do |t|
      t.integer :ppr_id
      t.string :asset

      t.timestamps
    end
  end
end
