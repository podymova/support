class CreateTcabels < ActiveRecord::Migration
  def change
    create_table :tcabels do |t|
      t.string :name
      t.string :prefix
      t.string :state
      t.string :order
      t.integer :user_id

      t.timestamps
    end
  end
end
