class CreateRoleUsers < ActiveRecord::Migration
  def change
    create_table :role_users do |t|
      t.string :login
      t.string :password
      t.string :fullname
      t.string :phone
      t.string :email
      t.string :state
      t.boolean :admin
      t.integer :role_id
      t.timestamps
    end
  end
end
