class PostsController < ApplicationController  
  
  def index
    @posts = current_user.posts
    respond_to do |format|
      format.html
    end
   end
  
  def new
    @post = Post.new
    respond_to do |format|
      format.js { render :nothing => false }
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
    @rating = Rating.find_by_user_id_and_post_id(current_user.id,@post.id)
    respond_to do |format|   
      format.html
      format.js{ render :nothing => false }
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
    @post.add_tags_through_string(params[:tag_list]) 
    respond_to do |format|
      if @post.save
        flash[:notice] = "Saved your post!"
        format.html { redirect_to posts_path }
        format.js { render :nothing => false }
      else
        flash[:notice] = "Post could not be saved"
        format.html { render :action  => 'new' }
        format.js { render :nothing => false }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/posts'
  end
end
