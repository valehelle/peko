class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.float :lat, :precision => 10, :scale => 6
      t.float :lng, :precision => 10, :scale => 6
      t.references :user, foreign_key: true
      t.string :question
      t.integer :view_count
      t.string :location
      t.integer :comment_count

      t.timestamps
    end
  end
end
