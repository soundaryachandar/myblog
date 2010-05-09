require 'spec_helper'

describe RatingsController do
  before do
    @user = login_new_user
    @post = create_new_post
    @rating = Rating.new
  end
  describe "POST /posts/:id/ratings" do
   
    context "when attributes are valid" do
      
      def do_post
        post :create,:post_id => @post.id, :rating => { :no_of_stars => 1 }
      end

    it "should be success" do
      do_post
      response.should redirect_to(post_path(@post))
      end 

    it "should save the rating" do
      do_post
        @post.rating.no_of_stars.should be >  0 
      end 
      
    it "should be associated with the current post" do
      do_post
        @post.rating = @rating
        @rating.post_id.should_not be_nil 
      end 
    end

    context "when attributes are invalid" do

      def do_post
        post :create,:post_id => @post.id , :rating => { :no_of_stars => nil }
      end
      
      it "should not be a success" do
        do_post
        response.should redirect_to(post_path(@post))
      end

      it "should not save the value of the rating" do
        do_post
        @post.rating.nil?.should be_true
      end 
    end
  end
end
