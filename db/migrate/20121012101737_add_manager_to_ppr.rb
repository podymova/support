class AddManagerToPpr < ActiveRecord::Migration
  def change
    add_column :pprs, :manager, :integer
    add_column :pprs, :resume, :text
    add_column :pprs, :date_to_inspoln, :timestamp
    add_column :pprs, :date_to_end, :timestamp
    add_column :pprs, :tasks_list, :text
  end
end
