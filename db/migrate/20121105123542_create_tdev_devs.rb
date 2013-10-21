class CreateTdevDevs < ActiveRecord::Migration
  def change
    create_table :tdev_devs do |t|
      t.string :inumber
      t.string :snumber
      t.string :ip
      t.string :mac
      t.string :state
      t.integer :order
      t.integer :user_id
      t.integer :tdev_id

      t.timestamps
    end
  end
end
