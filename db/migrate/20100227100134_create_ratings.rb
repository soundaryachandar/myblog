class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :no_of_stars
      t.integer :post_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
