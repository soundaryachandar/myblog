require 'spec_helper'

describe Comment do
  before(:each) do
    @valid_attributes = {
     :author => 'author',
      :body => 'some body'
    }
  end

  it "should create a new instance given valid attributes" do
    lambda do
      Comment.create!(@valid_attributes)
    end
  end
  
  it "should have an author" do
    @comment = Comment.new(@valid_attributes.merge({:author => nil }))
    @comment.save
    @comment.errors.size.should_not == 0
    end 

  it "should have a body" do
    @comment = Comment.new(@valid_attributes.merge({:body => nil }))
    @comment.save
    @comment.errors.size.should_not == 0
  end
end
