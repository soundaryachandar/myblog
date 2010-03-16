class CommentsController < ApplicationController
 def create
   @post = Post.find(params[:post_id])
   respond_to do |format|
     @comment = Comment.new(params[:comment])
     @comment.post = @post     
     if @comment.save
       flash[:notice] = "Comment saved"
       format.html { redirect_to post_path(@post) }
     else
       flash[:notice] = "Comment NOT saved"
       
       format.html{ redirect_to post_path(@post)}
     end    
   end
 end
end
