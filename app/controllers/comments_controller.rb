class CommentsController < ApplicationController
 def create
   #sleep(4)
   @post = Post.find(params[:post_id])
   respond_to do |format|
     @comment = Comment.new(params[:comment])
     @comment.post = @post     
     if @comment.save
       flash[:notice] = "Comment saved"
      # format.html { redirect_to post_path(@post) }
       format.js{ render :nothing => false }
     else
       flash[:notice] = "Comment NOT saved"
       format.js{ render :nothing => false }
       format.html{ redirect_to post_path(@post)}
     end    
   end
 end

 def show
   @post = Post.find(params[:post_id])
   respond_to do |format|
     format.html{ redirect_to post_path(@post)}

   end
 end
end
    
