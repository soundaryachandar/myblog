class RatingsController < ApplicationController
  def create
    @rating = Rating.new(params[:rating])
    respond_to do |format|
     
      puts @rating.post_id.to_s + "hello"
      if @rating.save
        @rating.reload
        @post = @rating.post
        format.html { redirect_to @post}
      else
        format.html { redirect_to @post}
      end
    end
  end
end
