class AddNoOfStarsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :no_of_stars, :integer
  end

  def self.down
    remove_column :users, :no_of_stars
  end
end
