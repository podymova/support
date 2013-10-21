class AddTitleToPprHardTops < ActiveRecord::Migration
  def change
    add_column :ppr_tops, :title, :string
  end
end
