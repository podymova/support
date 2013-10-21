class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :per_page
      t.string :pages_interval

      t.timestamps
    end
  end
end
