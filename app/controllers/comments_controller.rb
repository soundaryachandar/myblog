class CommentsController < ApplicationController
 def create
   @post = Post.find(params[:post_id])
   respond_to do |format|    
     @comment = Comment.new(params[:comment])
     @comment.post = @post
     if @comment.save
       flash[:notice] = "Comment saved"
       format.html { redirect_to @post }
     else
       flash[:notice] = "Comment NOT saved"
       redirect_to comments_path
     end    
   end
 end  
end

