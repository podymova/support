class AddTimestampToPprHards < ActiveRecord::Migration
  def change
      add_column(:ppr_hards, :created_at, :datetime)
      add_column(:ppr_hards, :updated_at, :datetime)
  end
end
