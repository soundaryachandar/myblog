class Rating < ActiveRecord::Base
  validates_presence_of :no_of_stars
  validates_presence_of :post_id
  belongs_to :post
end
