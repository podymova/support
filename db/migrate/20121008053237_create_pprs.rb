class CreatePprs < ActiveRecord::Migration
  def change
    create_table :pprs do |t|
      t.integer :user_id
      t.integer :street_id
      t.integer :house_id
      t.integer :entrance
      t.integer :floor

      t.timestamps
    end
  end
end
