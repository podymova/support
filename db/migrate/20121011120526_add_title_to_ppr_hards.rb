class AddTitleToPprHards < ActiveRecord::Migration
  def change
    add_column :ppr_hards, :title, :string
  end
end
