class CreateRootModelActions < ActiveRecord::Migration
  def change
    create_table :model_actions do |t|
      t.integer :model_id
      t.string :name
      t.string :state
      t.integer :order
      t.string :full

      t.timestamps
    end
  end
end
