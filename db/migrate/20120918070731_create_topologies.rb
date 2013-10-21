class CreateTopologies < ActiveRecord::Migration
  def change
    create_table :hardware_topologies do |t|
      t.integer :hardware_id
      t.string :name
      t.timestamps
    end
  end
end
