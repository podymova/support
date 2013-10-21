class CreateTdevs < ActiveRecord::Migration
  def change
    create_table :tdevs do |t|
      t.string :producer
      t.string :model
      t.string :prefix
      t.string :power
      t.string :state
      t.integer :order
      t.integer :user_id

      t.timestamps
    end
  end
end
