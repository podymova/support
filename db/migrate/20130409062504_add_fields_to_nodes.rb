class AddFieldsToNodes < ActiveRecord::Migration

  def change

      change_table :nodes do |t|
        t.integer :entrance
        t.string :item
        t.text :comment
        t.integer :quantity
        t.string :service_state
        t.string :inumber
        t.remove :dev_id
        t.remove :cabel_id
      end
      add_index :nodes, [:street_id, :house_id, :entrance], :unique => true

  end

end
