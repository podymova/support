class CreateDmovings < ActiveRecord::Migration
  def change
    create_table :dmovings do |t|
      t.integer :dev_id
      t.integer :nod_from
      t.integer :nod_to
      t.text  :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
