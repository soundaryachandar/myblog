class Rating < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :no_of_stars
  validates_numericality_of :no_of_stars, :greater_than => -1
  validates_presence_of :post_id

  after_create :recalculate_post_rating_average_and_increment_no_of_ratings
  private
  def recalculate_post_rating_average_and_increment_no_of_ratings
    post = self.post
    ratings = post.ratings
    ratings_count = post.no_of_ratings
    total = post.average_rating * ratings_count + self.no_of_stars
    average_rating = total/(ratings_count+1)
    post.average_rating = average_rating
    post.no_of_ratings += 1
    post.save!
  end
end
