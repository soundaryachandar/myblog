class AddAverageRatingToRatings < ActiveRecord::Migration
 def self.up
    add_column :ratings,:average_rating,:float
    add_column :ratings,:no_of_ratings,:integer
  end

  def self.down
    remove_column :ratings,:average_rating
    remove_column :ratings,:no_of_ratings
  end
end
