require 'spec_helper'

describe RatingsController do
  
  describe "POST /ratings" do
    before do
      @post = create_new_post
    end
    context "when attributes are valid" do
      
      def do_post
        post :create,:rating => { :no_of_stars => 1, :post_id => @post.id}
      end


    it "should be success" do
      do_post
      response.should redirect_to(post_path(@post))
      end 
    end
  end
end
