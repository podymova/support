class AddImageToPprReleaseAttaches < ActiveRecord::Migration
  def change

      change_table :ppr_release_attaches do |t|
        t.string :image
      end

  end
end
