class CreateGroupUsers < ActiveRecord::Migration

  def change
    create_table :group_users do |t|
      t.string :login
      t.string :password
      t.string :fullname
      t.string :phone
      t.string :email
      t.string :state
      t.boolean :admin
      t.integer :group_id
      t.timestamps
    end
  end

end
