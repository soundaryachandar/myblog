class RatingsController < ApplicationController
  def create
    @rating = Rating.new(params[:rating])
    respond_to do |format|
     
      if @rating.save
        @rating.reload
        @post = @rating.post
        format.html { redirect_to @post}
        format.js { render :nothing => false}
      else
        format.html { redirect_to @post}
        format.js { render :nothing => false}
      end
    end
  end
end
