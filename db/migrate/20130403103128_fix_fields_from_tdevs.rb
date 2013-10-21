class FixFieldsFromTdevs < ActiveRecord::Migration
    def change
      change_table :tdevs do |t|
        t.remove :producer
        t.remove :prefix
        t.remove :power
      end

      change_table :tdev_devs do |t|
        t.string :producer
        t.string :model
        t.string :power
      end
      add_index :tdev_devs, [:producer, :model], :unique => true
    end


end
