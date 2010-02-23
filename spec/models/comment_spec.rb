require 'spec_helper'

describe Comment do
  before(:each) do
    @valid_attributes = {
     :author => 'xyz',
      :body => 'a body'
    }
  end

  it "should create a new instance given valid attributes" do
    lambda do
      Comment.create!(@valid_attributes)
    end
  end
end
