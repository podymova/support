class CreatePprReleases < ActiveRecord::Migration
  def change
    create_table :ppr_releases do |t|
      t.integer :ppr_id
      t.integer :user_id
      t.integer :manager
      t.text :resume
      t.text :tasks_list
      t.timestamp :date2ispoln
      t.timestamp :date2end

      t.timestamps
    end
  end
end
