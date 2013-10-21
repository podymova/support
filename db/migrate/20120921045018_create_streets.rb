class CreateStreets < ActiveRecord::Migration
  def change 
    create_table :streets do |t|
       t.string :short
       t.string :name

       t.timestamps    
    end
  end
end
