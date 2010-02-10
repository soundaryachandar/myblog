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
    @post.save
  end
end
