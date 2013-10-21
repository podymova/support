class CreatePprUsers < ActiveRecord::Migration
  def change
    create_table :ppr_users do |t|
      t.integer :ppr_id
      t.integer :user_id
    end
  end
end
