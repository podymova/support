class AddFullToModels < ActiveRecord::Migration
  def change
    add_column :models, :full, :string
  end
end
