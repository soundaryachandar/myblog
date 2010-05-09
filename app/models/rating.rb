class Rating < ActiveRecord::Base
  validates_presence_of :no_of_stars
  validates_numericality_of :no_of_stars, :greater_than => 0
  validates_presence_of :post_id
  belongs_to :post
end
