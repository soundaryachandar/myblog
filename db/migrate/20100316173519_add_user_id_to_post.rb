class AddUserIdToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :user_id , :integer
    remove_column :posts, :blogger_id
  end

  def self.down
    remove_column :posts, :user_id
    add_column :posts, :blogger_id, :integer
  end
end
