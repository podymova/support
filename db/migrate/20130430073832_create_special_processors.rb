class CreateSpecialProcessors < ActiveRecord::Migration
  def change
    create_table :processors do |t|
      t.string :name
      t.string :class
      t.string :attr
      t.string :state

      t.timestamps
    end
  end
end
