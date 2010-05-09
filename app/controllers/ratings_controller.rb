class RatingsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    respond_to do |format|
      @rating = Rating.new(params[:rating])
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
