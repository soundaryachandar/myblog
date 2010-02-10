require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostsController do

  describe "GET /index" do
    
    def do_get
      get :index
    end
    
    
    it "should be successful" do
      do_get
      response.should be_success
    end
    
    it "should find all the posts" do
      do_get
      assigns[:posts].should == Post.all
    end
    
    it "should render the index.html.erb" do
      do_get
      response.should render_template('index')
    end
  end
  
  describe "GET /new" do 
    def do_get
      get :new
    end
    
    
  end
  
  describe "POST /posts" do 
    context "when the params are valid" do
      def do_post
        post :create, :post => { :title => 'a title of post', :body => 'body', :author => 'author'}
      end
    end
  end
  
  context "when params are invalid" do 
    def do_post
      post :create, :post => {:body => 'body', :author => 'author'}
    end
    
    it "should create a post" do
      do_post
      assigns[:post].errors.size.should_not == 0
    end
  end
    
end
