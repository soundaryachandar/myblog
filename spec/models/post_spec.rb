require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
  # before(:each) do
    
  # end

  it "should create a new instance given valid attributes" do
    lambda do
      create_post
    end.should change(Post, :count)
  end
  

  it "should have a title" do    
    lambda { create_post({ :title => nil})
    }.should_not change(Post, :count)
    
  end
  
  it "should have a body" do
    lambda { 
      @post = create_post({ :body => nil})
      @post.errors.on(:body).should == ("can't be blank")
      @post.should_not be_valid
    }.should_not change(Post,:count)
  end
  
  it "should allow the body to be changed" do
    @post = create_post
    lambda do
      @post.body = "another body"
      @post.save
    end.should change(@post, :body)    
  end
  
  it "should have many comments" do 
    @post = create_post
    @post.comments.should == []
  end

  it "should have many ratings" do
    @post = create_post
    @post.ratings.should == []
  end 
end
def create_post(options = { })
 @valid_attributes = { :title => "some title",
  :body => "some body", :comment_id => 1}.merge(options)
  p = Post.new(@valid_attributes)
  p.save
  p
end

