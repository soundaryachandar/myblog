require 'spec_helper'

describe PostsHelper do
  
  def create_new_post
    post = Post.create!(params[:title => 'a title', :body => 'a body'])
    return post
  end
 

end
