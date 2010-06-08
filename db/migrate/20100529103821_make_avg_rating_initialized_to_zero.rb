class MakeAvgRatingInitializedToZero < ActiveRecord::Migration
  def self.up
    remove_column :posts, :average_rating
    remove_column :posts, :no_of_ratings
    add_column :posts, :average_rating, :float, :default => 0
    add_column :posts, :no_of_ratings, :integer, :default => 0
  end

  def self.down
    remove_column :posts, :average_rating
    add_column :posts, :average_rating, :float
    remove_column :posts, :no_of_ratings
    add_column :posts, :no_of_ratings, :integer
  end
end
