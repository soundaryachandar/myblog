require 'spec_helper'

describe Rating do
  before(:each) do
    @post = create_new_post
    @valid_attributes = {
      :no_of_stars => 1,
      :post_id => @post.id,
     }
  end

  it "should create a new rating given valid attributes" do
    Rating.create!(@valid_attributes)
  end
  
  it "should not create a rating if number of stars id empty" do
    lambda do 
      @rating = create_rating(:no_of_stars => nil)
    end.should_not change(Rating,:count) 
  end

  it "should be invalid if it does not belong to a post" do
    lambda do
     @rating = create_rating(:post_id => nil)
    end.should_not change(Rating,:count)
  end
  
  it "should belong to a post" do
      @rating = create_rating()
      @rating.post.should == @post
  end 

  it "should keep a track of the number of ratings" do
    lambda do
    @rating = create_rating()
    end
  end 

  it "should calculate the average rating when it is the first rating" do
    @rating = create_rating(:no_of_stars => 3)
    @post.reload
    @post.average_rating.should == 3
  end 
  
  it "should calculate the average rating when average rating already exists" do 
    (1..3).each do |i|
      create_rating(:no_of_stars => i)
    end
    @post.reload
    @post.average_rating.should == 2.0
  end 

  it "should increase the number of ratings count for the post" do 
    lambda{ create_rating; @post.reload}.should change(@post, :no_of_ratings).by(1)
  end

  it "should have a user_id if rated" do
      @rating  = create_rating(:user_id => 1,:no_of_stars => 3)
      @rating.user_id.should_not be_nil
  end 

  it "should have a nil user id, if not rated" do
    @rating = create_rating(:no_of_stars => nil)
    @rating.user_id.should be_nil
  end 
end
private  
def create_rating( options = { })
    rating = Rating.new(@valid_attributes.merge(options))
    rating.save
    rating
end

