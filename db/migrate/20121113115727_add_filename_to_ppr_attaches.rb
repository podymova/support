class AddFilenameToPprAttaches < ActiveRecord::Migration
  def change
    add_column :ppr_attaches, :filename, :string
  end
end
