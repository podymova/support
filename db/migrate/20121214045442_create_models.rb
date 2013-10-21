class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.string :state
      t.integer :order
      t.string :section

      t.timestamps
    end
  end
end
