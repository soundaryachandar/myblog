require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
  before(:each) do
    @valid_attributes = {
      :title => 'a title',
      :body => 'a body',
      :author => 'an author'
    }
  end

  it "should create a new instance given valid attributes" do
    lambda do
      Post.create!(@valid_attributes)
    end
  end
  
  it "should have a title" do    
    @post = Post.new(@valid_attributes.merge({ :title => nil}))
    @post.save
    @post.errors.size.should_not == 0       
  end
  
  it "should have a body" do
    @post = Post.new(@valid_attributes.merge({ :body => nil}))
    @post.save
    @post.errors.size.should_not == 0       
  end
  
  it "should have an author" do
    lambda do
      @post = Post.new(@valid_attributes.merge({ :author => nil}))
      @post.save
    end.should_not change(Post, :count)
  end
  
  it "should allow the body to be changed" do
    @post = Post.create!(@valid_attributes)
    lambda do
      @post.body = "another body"
      @post.save
    end.should change(@post, :body)
  end
end
