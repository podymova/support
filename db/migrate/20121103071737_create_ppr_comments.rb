class CreatePprComments < ActiveRecord::Migration
  def change
    create_table :ppr_comments do |t|
      t.integer :ppr_id
      t.text :body

      t.timestamps
    end
  end
end
