class CreatePprReleaseComments < ActiveRecord::Migration
  def change
    create_table :ppr_release_comments do |t|
      t.integer :release_id
      t.integer :ppr_id
      t.text :body

      t.timestamps
    end
  end
end
