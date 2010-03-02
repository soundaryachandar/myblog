require 'spec_helper'

describe Comment do
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

  it "is invalid without a post" do
    lambda{ create_comment({ :post_id => nil})}.should_not change(Comment, :count)    
  end
  
  it "is invalid with no body" do
    set_comment_attributes(@comment, :body => nil)
    @comment.should_not be_valid
    @comment.errors.on(:body).should_not be_nil
  end

  it "is invalid with no author" do
    set_comment_attributes(@comment, :author => nil)
    @comment.should_not be_valid
    @comment.errors.on(:author).should_not be_nil
  end
  
  it "is valid with all attributes" do
    set_comment_attributes(@comment)
    @comment.should be_valid
  end
  
  it "should belong to a post" do
    @valid_attributes = valid_attributes
    @comment = Comment.create!(@valid_attributes)
    @comment.post.should == @post
  end
  
  
  private
  def create_comment(options ={ })
    comment = Comment.new({ 
                            :author => 'XYZ',
                            :body => 'Some text',
                            :post_id => 1,     
                          }.merge(options))
    comment.save
    comment
  end
end




