require 'spec_helper'

describe CommentsController do
  describe "POST /comments" do
 def do_post 
   post :create, :comment => { :author => 'a author',:description => 'a desc' }
 end
 
 it "should be success" do
   do_post
   flash[:notice].should_not be_nil
 end
end
end
