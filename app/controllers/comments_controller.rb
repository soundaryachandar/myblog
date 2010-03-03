class CommentsController < ApplicationController
 def create
   @post = Post.find(params[:post_id])
   respond_to do |format|
     @comment = Comment.new(params[:comment])
     @comment.post = @post     
     if @comment.save
       flash[:notice] = "Comment saved"
       format.html { redirect_to post_comment_path(@post, @comment) }
     else
       flash[:notice] = "Comment NOT saved"
<<<<<<< HEAD
       redirect_to comments_path
     end
=======
       format.html{ redirect_to post_path(@post)}
     end    
>>>>>>> 6927e0622ba4e59a5251a93303c37514b109a545
   end
 end
end
