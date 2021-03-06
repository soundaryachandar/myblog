class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.string :author
      t.integer :comment_id
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
