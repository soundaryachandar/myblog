require 'spec_helper'

describe CommentsController do
  describe "POST /comments" do
    before do
      @post = create_new_post
    end
    context "when params are valid" do           
      def do_post
        post :create, :post_id => @post.id, :comment => { :author => 'xyz',:body => 'a desc' }
      end
      
      it "should redirect" do
        do_post        
        @comment = Comment.first
        response.should redirect_to(post_comment_path(@post,@comment))
      end
      
      it "should flash a message" do
        do_post
        flash[:notice].should_not be_nil
      end          
    end
    
    context "when params are invalid" do         
      def do_post
        post :create, :post_id => @post.id, :comment => {}
      end
      
      it "should redirect to the current post" do 
        do_post
        response.should redirect_to(post_path(@post))
      end
    end
      
  end
end
