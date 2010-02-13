class PostsController < ApplicationController

  def index
    @posts = Post.all
    respond_to do |format|
      format.html
    end
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Saved your post!"
      redirect_to posts_path
    else
      flash[:error] = "Could not save the post!"
    end
  end
end
