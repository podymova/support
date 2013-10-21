class CreateTcabelCabels < ActiveRecord::Migration
  def change
    create_table :tcabel_cabels do |t|
      t.string :inumber
      t.string :length
      t.text :comment
      t.string :state
      t.integer :order
      t.integer :tcabel_id
      t.integer :user_id

      t.timestamps
    end
  end
end
