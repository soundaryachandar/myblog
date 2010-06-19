require 'spec_helper'

describe TagsController do
  

  def create_post
    @post = create_new_post
  end

  before(:each) do
    pending
    create_post
    @post.tag_list = ["tag1,tag2"]
    @post.save
  end
  
  it "should allow the user to add new tags" do
   lambda do
    @post.tag_list.add("tag3")
    @post.save
    end 
  end
end
