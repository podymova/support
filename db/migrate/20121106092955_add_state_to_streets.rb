class AddStateToStreets < ActiveRecord::Migration
  def change
    add_column :streets, :state, :string
  end
end
