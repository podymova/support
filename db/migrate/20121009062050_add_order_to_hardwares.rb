class AddOrderToHardwares < ActiveRecord::Migration
  def change
    add_column :hardwares, :order, :integer
  end
end
