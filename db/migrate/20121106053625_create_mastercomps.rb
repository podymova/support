class CreateMastercomps < ActiveRecord::Migration
  def change
    create_table :mastercomps do |t|
      t.string :name
      t.integer :street_id
      t.integer :house_id
      t.integer :flat_id
      t.integer :user_id
      t.string  :state
      t.integer :order

      t.timestamps
    end
  end
end
