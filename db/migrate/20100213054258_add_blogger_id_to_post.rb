class AddBloggerIdToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :blogger_id, :integer
  end

  def self.down
    remove_column :posts, :blogger
  end
end
