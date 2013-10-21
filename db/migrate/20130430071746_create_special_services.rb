class CreateSpecialServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :dictionary
      t.integer :inserted
      t.integer :updated
      t.integer :deleted
      t.integer :user
      t.boolean :update
      t.boolean :clear
      t.text :info
      t.string :state

      t.timestamps
    end
  end
end
