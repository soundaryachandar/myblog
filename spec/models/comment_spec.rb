require 'spec_helper'

describe Comment do
<<<<<<< HEAD
  def valid_attributes(extra = {}) {
      :author => 'XYZ',
      :body => 'Some text',
      :post_id => @post.id,
      :created_at => '20100222153711',
      :updated_at => '20100222153711'
  }.merge(extra)
  end
 
  def set_comment_attributes(comment,extra = {})
    valid_attributes(extra).each_pair do |key,value|
      comment.send("#{key}=",value)
    end
  end

  before(:each) do
    @post = create_new_post
    @post.save!

    @comment = Comment.new
end
=======

  before(:each) do
    @post = create_new_post    
  end
>>>>>>> 6927e0622ba4e59a5251a93303c37514b109a545

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




