class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :house_id
      t.integer :dev_id
      t.integer :cabel_id
      t.integer :order
      t.string  :inumber
      t.string  :mvlan
      t.string  :cvlan
      t.string  :state
      t.integer :user_id

      t.timestamps
    end
  end
end
