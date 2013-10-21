class CreateRoleRights < ActiveRecord::Migration
  def change
    create_table :role_rights do |t|
      t.integer :model_id
      t.string :full_name
      t.integer :role_id
      t.boolean :ashow
      t.boolean :aedit
      t.boolean :adelete

      t.timestamps
    end
  end

#  def change
#    create_table :role_rights do |t|
#      t.integer :model_id
#      t.string :full_name
#      t.integer :role_id
#      t.boolean :index
#      t.boolean :new
#      t.boolean :edit
#      t.boolean :show
#      t.boolean :create
#      t.boolean :update
#      t.boolean :destroy
#
#      t.timestamps
#    end
#  end
end
