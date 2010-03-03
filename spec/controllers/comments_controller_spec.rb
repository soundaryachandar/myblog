require 'spec_helper'

describe CommentsController do
  describe "POST /comments" do
    context "when params are valid" do
     
      before do
        @post = create_new_post
      end
      
      def do_post
        post :create, :post_id => @post.id, :comment => { :author => 'xyz',:body => 'a desc' }
      end
      it "should redirect" do
        do_post
        response.should redirect_to(post_path(@post))
      end
      
      it "should flash a message" do
        do_post
        flash[:notice].should_not be_nil
      end
      
     
    end
  end
end
