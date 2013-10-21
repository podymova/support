class AddFiledsToNodeDevs < ActiveRecord::Migration


  def change

      change_table :node_devs do |t|
        t.string :item
        t.text :comment
        t.integer :quantity
        t.string :service_state
        t.string :inumber
        t.string :snumber
        t.string :ip
        t.string :mac
        t.integer :entrance

        t.timestamps
      end
      add_index :node_devs, [:node_id, :inumber], :unique => true

  end



end
