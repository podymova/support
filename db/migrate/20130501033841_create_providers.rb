class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :class_name
      t.string :attr
      t.string :state

      t.timestamps
    end
  end
end
