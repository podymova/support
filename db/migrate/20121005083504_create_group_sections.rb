class CreateGroupSections < ActiveRecord::Migration
  def change
    create_table :group_sections do |t|
      t.string :name
      t.string :section
      t.string :link
      t.integer :group_id

      t.timestamps
    end
  end

end
