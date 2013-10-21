class CreateNodeDevs < ActiveRecord::Migration
  def change
    create_table :node_devs do |t|
      t.integer :node_id
      t.integer :dev_id
    end
  end
end
