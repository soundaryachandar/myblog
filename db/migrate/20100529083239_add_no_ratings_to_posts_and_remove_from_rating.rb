class AddNoRatingsToPostsAndRemoveFromRating < ActiveRecord::Migration
  def self.up
    add_column :posts, :no_of_ratings, :integer
    add_column :posts, :average_rating, :float
    remove_column :ratings, :average_rating
    remove_column :ratings, :no_of_ratings
  end

  def self.down
    add_column :ratings,:average_rating,:float
    add_column :ratings,:no_of_ratings,:integer 
    remove_column :posts, :no_of_ratings
    remove_column :posts, :average_rating
  end
end
