class CreatePprReleaseUsers < ActiveRecord::Migration
  def change
    create_table :ppr_release_users do |t|
      t.integer :release_id
      t.integer :ppr_id
      t.integer :user_id
    end
  end
end
