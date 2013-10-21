class CreateRootBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.integer :user_id
      t.text :body
      t.string :state
      t.string :responce
      t.string :subject

      t.timestamps
    end
  end
end
