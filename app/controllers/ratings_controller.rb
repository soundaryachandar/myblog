class RatingsController < ApplicationController
 
def create
    respond_to do |format|
      @rating = Rating.new(params[:rating])  
      if @rating.save
        @post = @rating.post
        @rating.user_id = current_user.id
        current_user.no_of_stars = @rating.no_of_stars
        format.js { render :nothing => false }
        #format.html { redirect_to @post  }
      else
        format.js { render :nothing => false }
        #format.html { redirect_to @post }
      end
    end
  end
end
