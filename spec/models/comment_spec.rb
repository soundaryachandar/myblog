require 'spec_helper'

describe Comment do

  before(:each) do
    @post = create_new_post    
  end

  it "is invalid without a post" do
    lambda{ create_comment({ :post_id => nil})}.should_not change(Comment, :count)    
  end
  
  it "is invalid with no body" do
    lambda do
    create_comment({ :body => nil})
    end.should_not change(Comment, :count)
  end
  
  it "should save a comment if the updated comment has no body" do
    @comment = create_comment
    lambda do
      @comment.body = nil
      @comment.save
      @comment.reload
    end.should_not change(@comment, :body)
  end

  it "is invalid with no author" do
    lambda {create_comment({:author => nil})}.should_not change(Comment, :count)
  end
  
  it "should increase the count of comments when attributes are valid" do
    lambda{ create_comment }.should change(Comment, :count)
  end
  
  it "should belong to a post" do
    @comment = create_comment
    @comment.post.should == @post
  end
  
  
  private
  def create_comment(options ={ })
    comment = Comment.new({ 
                            :author => 'XYZ',
                            :body => 'Some text',
                            :post_id => @post.id,     
                          }.merge(options))
    comment.save
    comment
  end
end




