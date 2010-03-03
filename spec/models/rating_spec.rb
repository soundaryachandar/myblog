require 'spec_helper'

describe Rating do
  before(:each) do
    @post = create_new_post
    @valid_attributes = {
      :no_of_stars => 1,
      :post_id => @post.id
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
  private  
  def create_rating( options = { })
    rating = Rating.new(@valid_attributes.merge(options))
    rating.save
    rating
  end
end
