class RatingsController < ApplicationController
 
def create
    @post = Post.find(params[:post_id])
    respond_to do |format|
      @rating = Rating.new()
      @rating.no_of_stars= params[:rating][:no_of_stars]
      @rating.post_id= params[:rating][:post_id]
      @post.rating = @rating
      if @rating.save
        format.js { render :nothing => false }
        format.html { redirect_to @post  }
      else
        format.js { render :nothing => false }
        format.html { redirect_to @post }
      end
    end
  end
end
