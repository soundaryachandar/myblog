class RatingsController < ApplicationController
 
def create
    respond_to do |format|
      @rating = Rating.new(params[:rating])  
      if @rating.save
        @post = @rating.post
        format.js { render :nothing => false }
        #format.html { redirect_to @post  }
      else
        format.js { render :nothing => false }
        #format.html { redirect_to @post }
      end
    end
  end

def calculate_average_rating(avg_current_rating,no_of_ratings,no_of_stars)
  numerator = no_of_stars+(avg_current_rating)*no_of_ratings
  new_average_rating = numerator/no_of_ratings
  return new_average_rating
end

end
