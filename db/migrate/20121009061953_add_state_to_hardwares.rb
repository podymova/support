class AddStateToHardwares < ActiveRecord::Migration
  def change
    add_column :hardwares, :state, :string
  end
end
