class ChangeLngName < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :posts, :lng, :longitude
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
