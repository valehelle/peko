class ChangeLatName < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :posts, :lat, :latitude
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
