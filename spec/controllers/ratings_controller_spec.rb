require 'spec_helper'

describe RatingsController do
  before do
    @user = login_new_user
    @post = create_new_post
  end
  describe "POST /posts/:id/ratings" do
   
    context "when attributes are valid" do
      
      def do_post
        post :create,:rating => { :no_of_stars => 1,:post_id => @post.id  }
      end

      it "should be success" do
        do_post
        response.should be_success
      end 
      
      it "should increase the number of ratings for the post" do
        lambda do
        do_post
          @post.ratings.reload
        end.should change(@post.ratings,:count)
      end
    end
    context "when attributes are invalid" do

      def do_post
        post :create, :rating => { :no_of_stars => -1, :post_id => @post.id }
      end
      
      it "should not be a success" do
        do_post
        response.should be_success
      end

      it "should not save the value of the rating" do
        lambda do
        do_post
       end.should_not change(@post.ratings,:count)
      end 
    end
  end
end
