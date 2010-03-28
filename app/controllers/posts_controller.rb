class PostsController < ApplicationController  
  
  def index
    @posts = current_user.posts
    respond_to do |format|
      format.html
    end
   end
  
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|   
      format.html
      format.js{ render :nothing => false}
    end
    
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully edited"
      redirect_to @post
    else
      render :action => 'edit'
    end
  end
  
  def create
    @post = Post.new(params[:post]) 
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Saved your post!"
      redirect_to posts_path
     else
      flash[:notice] = "Post could not be saved"
      render :action  => 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/posts'
  end 
end
